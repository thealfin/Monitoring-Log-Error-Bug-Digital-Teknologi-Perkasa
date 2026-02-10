-- ==========================================
-- FINAL DATABASE SCHEMA (PESANTREN SMART DIGITAL)
-- ==========================================

-- 1. ENUMS
CREATE TYPE bug_priority AS ENUM ('Rendah', 'Sedang', 'Tinggi', 'Critical');
CREATE TYPE bug_status AS ENUM ('Report', 'To Do', 'On Progress', 'Done', 'Reject');
CREATE TYPE change_type AS ENUM ('Feature', 'Fix', 'Improvement', 'Security', 'Refactor');

-- 2. CORE TABLES
CREATE TABLE projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE access_roles (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE, 
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
-- Seed Default Roles
INSERT INTO access_roles (name, description) VALUES 
('Super Admin', 'Full Access'),
('Editor', 'Can Edit Logs'),
('Viewer', 'Read Only');


CREATE TABLE app_components (
  id SERIAL PRIMARY KEY,
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  code TEXT UNIQUE,
  description TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. USER MANAGEMENT
CREATE TABLE profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  full_name TEXT,
  email TEXT,
  avatar_url TEXT,
  last_active TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE user_access_mapping (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  role_id INTEGER REFERENCES access_roles(id) ON DELETE CASCADE,
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, project_id)
);

-- 4. ACCESS CONTROL MATRIX (CRUDV)
CREATE TABLE access_permissions (
  id SERIAL PRIMARY KEY,
  role_id INTEGER REFERENCES access_roles(id) ON DELETE CASCADE,
  component_id INTEGER REFERENCES app_components(id) ON DELETE CASCADE,
  can_create BOOLEAN DEFAULT FALSE, -- C
  can_read BOOLEAN DEFAULT TRUE,    -- R
  can_update BOOLEAN DEFAULT FALSE, -- U
  can_delete BOOLEAN DEFAULT FALSE, -- D
  can_verify BOOLEAN DEFAULT FALSE, -- V (Verification/Validation)
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(role_id, component_id)
);

-- 5. OPERATIONAL DATA
CREATE TABLE logs (
  id SERIAL PRIMARY KEY,
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  component_id INTEGER REFERENCES app_components(id),
  no_lap SERIAL,
  version TEXT NOT NULL,
  found_date TIMESTAMPTZ DEFAULT NOW(),
  title TEXT,
  module TEXT, -- Legacy support / Specific submodule
  priority bug_priority DEFAULT 'Sedang',
  severity_details TEXT,
  actual_behavior TEXT,
  expected_behavior TEXT,
  status bug_status DEFAULT 'Report',
  reporter_id UUID REFERENCES profiles(id),
  attachment_link TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE version_logs (
  id SERIAL PRIMARY KEY,
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  version TEXT NOT NULL,
  release_date DATE DEFAULT CURRENT_DATE,
  change_category change_type DEFAULT 'Feature',
  short_description TEXT NOT NULL,
  detail_changes TEXT,
  pic_id UUID REFERENCES profiles(id),
  status bug_status DEFAULT 'Done',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE discussion_forum (
  id SERIAL PRIMARY KEY,
  log_id INTEGER REFERENCES logs(id) ON DELETE CASCADE,
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  comment_text TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. SECURITY & TRIGGERS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE version_logs ENABLE ROW LEVEL SECURITY;

-- Trigger: Auto-create Profile on Signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.profiles (id, full_name, email, avatar_url)
  VALUES (new.id, new.raw_user_meta_data->>'full_name', new.email, new.raw_user_meta_data->>'avatar_url');
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();

-- Trigger: Updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_logs_modtime BEFORE UPDATE ON logs FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

-- 7. FEATURE ROADMAP / BACKLOG
CREATE TYPE feature_stage AS ENUM ('Backlog', 'Discovery', 'Development', 'Testing', 'Live');
CREATE TYPE feature_urgency AS ENUM ('Low', 'Medium', 'High', 'Critical');

CREATE TABLE feature_backlog (
  id SERIAL PRIMARY KEY,
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
  feature_name TEXT NOT NULL,
  functionality TEXT,
  urgency feature_urgency DEFAULT 'Medium',
  placement_area TEXT, 
  dependencies TEXT,
  
  -- Product Management Fields
  impact_score INTEGER CHECK (impact_score >= 1 AND impact_score <= 10),
  target_launch DATE,
  stage feature_stage DEFAULT 'Backlog',
  prd_link TEXT,
  owner_id UUID REFERENCES profiles(id),
  
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS for Feature Backlog
ALTER TABLE feature_backlog ENABLE ROW LEVEL SECURITY;

-- Everyone can view
CREATE POLICY "Semua user bisa melihat roadmap fitur" 
ON feature_backlog FOR SELECT 
TO authenticated 
USING (true);

-- Only Editors (and Super Admins) can manage
CREATE POLICY "Hanya Editor yang bisa mengelola roadmap" 
ON feature_backlog FOR ALL 
TO authenticated 
USING (
  EXISTS (
    SELECT 1 
    FROM user_access_mapping uam
    JOIN access_roles ar ON uam.role_id = ar.id
    WHERE uam.user_id = auth.uid() 
    AND ar.name IN ('Editor', 'Super Admin')
  )
);

