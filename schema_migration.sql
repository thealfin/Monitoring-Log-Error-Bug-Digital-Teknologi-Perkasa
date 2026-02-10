-- ==========================================
-- MIGRATION SQL: ADD NEW FEATURES TO EXISTING SCHEMA
-- ==========================================

-- 1. ADD NEW ENUMS (If they don't exist yet, safe to run)
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

-- 2. FEATURE ROADMAP / BACKLOG (New Table)
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

-- 3. ACCESS CONTROL MATRIX (If strictly needed as TABLE)
-- Ensure this matches your existing access_roles UUID type
CREATE TABLE IF NOT EXISTS public.access_matrix (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  role_id uuid REFERENCES public.access_roles(id) ON DELETE CASCADE,
  component_id uuid REFERENCES public.app_components(id) ON DELETE CASCADE,
  can_create boolean DEFAULT false, -- C
  can_read boolean DEFAULT true,    -- R
  can_update boolean DEFAULT false, -- U
  can_delete boolean DEFAULT false, -- D
  can_verify boolean DEFAULT false, -- V
  access_note text,
  updated_at timestamp with time zone DEFAULT now(),
  updated_by uuid REFERENCES public.profiles(id),
  UNIQUE(role_id, component_id)
);

-- 4. VERSION CONTROL (Updating existing or creating if missing)
CREATE TABLE IF NOT EXISTS public.version_logs (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  project_id bigint REFERENCES public.projects(id) ON DELETE CASCADE, -- Fix: Link to Project
  component_id uuid REFERENCES public.app_components(id) ON DELETE SET NULL,
  version_number text NOT NULL,
  release_date date DEFAULT CURRENT_DATE,
  change_type varchar(50) DEFAULT 'Feature', -- Or use ENUM if preferred
  title text NOT NULL,
  details text,
  is_published boolean DEFAULT true,
  pic_id uuid REFERENCES public.profiles(id),
  created_at timestamp with time zone DEFAULT now()
);

-- 5. UPDATED_AT TRIGGER (Generic)
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
