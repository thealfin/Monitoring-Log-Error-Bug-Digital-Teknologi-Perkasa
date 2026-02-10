-- ==========================================
-- SKEMA AWAL (OLD SCHEMA)
-- ==========================================
-- Berikut adalah tabel-tabel dari skema awal Anda.

-- 1. Create Projects Table (BIGINT ID)
CREATE TABLE IF NOT EXISTS public.projects (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  name text NOT NULL,
  description text,
  created_at timestamp with time zone DEFAULT now()
);

-- 2. Create Profiles Table (UUID ID, with Role Column)
CREATE TABLE IF NOT EXISTS public.profiles (
  id uuid NOT NULL PRIMARY KEY,
  full_name text NOT NULL,
  email text NOT NULL UNIQUE,
  role text DEFAULT 'Viewer', -- Simplified from USER-DEFINED for broad compatibility, or keep ENUM if preferred
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

-- 3. Create Logs Table (BIGINT ID)
CREATE TABLE IF NOT EXISTS public.logs (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  project_id bigint NOT NULL REFERENCES public.projects(id),
  no_lap integer NOT NULL,
  version text NOT NULL,
  found_date timestamp with time zone NOT NULL,
  module text NOT NULL,
  priority text DEFAULT 'Medium', -- Simplified Enum
  status text DEFAULT 'Report',   -- Simplified Enum
  reporter_id uuid REFERENCES public.profiles(id),
  actual_behavior text NOT NULL,
  expected_behavior text NOT NULL,
  severity_details text NOT NULL,
  attachment_link text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

-- 4. Create Discussion Forum Table
CREATE TABLE IF NOT EXISTS public.discussion_forum (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  log_id bigint NOT NULL REFERENCES public.logs(id),
  user_id uuid NOT NULL REFERENCES public.profiles(id),
  comment_text text NOT NULL,
  created_at timestamp with time zone DEFAULT now()
);

-- 5. Create App Components & Access Roles (Old Access Control)
CREATE TABLE IF NOT EXISTS public.app_components (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp with time zone DEFAULT now(),
  project_id bigint REFERENCES public.projects(id),
  name text NOT NULL,
  description text
);

CREATE TABLE IF NOT EXISTS public.access_roles (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id bigint REFERENCES public.projects(id),
  role_code character varying NOT NULL,
  role_name text NOT NULL,
  description text,
  created_at timestamp with time zone DEFAULT now()
);

-- 6. User Access Mapping (Optional in old schema but good to have)
CREATE TABLE IF NOT EXISTS public.user_access_mapping (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  user_id uuid REFERENCES public.profiles(id),
  project_id bigint REFERENCES public.projects(id)
);


-- ==========================================
-- FITUR BARU (NEW FEATURES MIGRATION)
-- ==========================================
-- Berikut adalah query tambahan untuk fitur Roadmap, Version Control, & Matrix Access.

-- 7. Create New Enums (If not exists)
DO $$ BEGIN
    CREATE TYPE feature_stage AS ENUM ('Backlog', 'Discovery', 'Development', 'Testing', 'Live');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE feature_urgency AS ENUM ('Low', 'Medium', 'High', 'Critical');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- 8. Feature Roadmap / Backlog (New Table)
-- Uses BIGINT for ID and Project_ID to match existing schema
CREATE TABLE IF NOT EXISTS public.feature_backlog (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  project_id bigint REFERENCES public.projects(id) ON DELETE CASCADE,
  feature_name text NOT NULL,
  functionality text,
  urgency feature_urgency DEFAULT 'Medium',
  placement_area text, 
  dependencies text,
  
  -- Product Management Fields
  impact_score integer CHECK (impact_score >= 1 AND impact_score <= 10),
  target_launch date,
  stage feature_stage DEFAULT 'Backlog',
  prd_link text,
  owner_id uuid REFERENCES public.profiles(id),
  
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now()
);

-- Enable RLS for Feature Backlog
ALTER TABLE public.feature_backlog ENABLE ROW LEVEL SECURITY;

-- RLS Policy: Authenticated users can view
CREATE POLICY "Enable read access for all users" ON public.feature_backlog FOR SELECT USING (true);

-- RLS Policy: Editors/Admins can manage (Using profiles.role)
CREATE POLICY "Enable all access for editors" ON public.feature_backlog FOR ALL USING (
  exists (
    select 1 from public.profiles
    where profiles.id = auth.uid()
    and (lower(profiles.role::text) = 'editor' OR lower(profiles.role::text) = 'admin' OR lower(profiles.role::text) = 'super admin')
  )
);

-- 9. Access Control Matrix (Granular Permission Table)
CREATE TABLE IF NOT EXISTS public.access_permissions (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  role_id uuid REFERENCES public.access_roles(id) ON DELETE CASCADE, -- Note: Links to access_roles UUID
  component_id uuid REFERENCES public.app_components(id) ON DELETE CASCADE, -- Note: Links to app_components UUID
  can_create boolean DEFAULT false, -- C
  can_read boolean DEFAULT true,    -- R
  can_update boolean DEFAULT false, -- U
  can_delete boolean DEFAULT false, -- D
  can_verify boolean DEFAULT false, -- V (Verification/Approval)
  access_note text,
  updated_at timestamp with time zone DEFAULT now(),
  updated_by uuid REFERENCES public.profiles(id),
  UNIQUE(role_id, component_id)
);

-- 10. Version Control / Release Logs (New/Updated Table)
CREATE TABLE IF NOT EXISTS public.version_logs (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id bigint REFERENCES public.projects(id) ON DELETE CASCADE, -- Fix: Link to Project BIGINT
  component_id uuid REFERENCES public.app_components(id) ON DELETE SET NULL,
  version_number text NOT NULL,
  release_date date DEFAULT CURRENT_DATE,
  change_type varchar(50) DEFAULT 'Feature',
  title text NOT NULL,
  details text,
  is_published boolean DEFAULT true,
  pic_id uuid REFERENCES public.profiles(id),
  created_at timestamp with time zone DEFAULT now()
);

-- 11. Helper Function for Updated At
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply Trigger to Feature Backlog
DROP TRIGGER IF EXISTS update_feature_backlog_modtime ON public.feature_backlog;
CREATE TRIGGER update_feature_backlog_modtime BEFORE UPDATE ON public.feature_backlog FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
