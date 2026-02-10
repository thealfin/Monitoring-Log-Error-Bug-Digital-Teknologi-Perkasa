-- 1. Add columns to discussion_forum table
ALTER TABLE public.discussion_forum 
ADD COLUMN IF NOT EXISTS media_url text,
ADD COLUMN IF NOT EXISTS media_type text; -- 'image', 'video', or NULL

-- 2. Create Storage Bucket for discussion attachments
-- Note: This requires the storage extension to be enabled in Supabase
INSERT INTO storage.buckets (id, name, public) 
VALUES ('discussion_attachments', 'discussion_attachments', true)
ON CONFLICT (id) DO NOTHING;

-- 3. Set up Storage Policies for discussion_attachments
-- Allow public read access
CREATE POLICY "Public Read Access" 
ON storage.objects FOR SELECT 
USING (bucket_id = 'discussion_attachments');

-- Allow authenticated users to upload
CREATE POLICY "Authenticated User Upload" 
ON storage.objects FOR INSERT 
WITH CHECK (
  bucket_id = 'discussion_attachments' 
  AND auth.role() = 'authenticated'
);

-- Allow owners to delete their own media
CREATE POLICY "Owner Delete Access" 
ON storage.objects FOR DELETE 
USING (
  bucket_id = 'discussion_attachments' 
  AND auth.uid() = owner
);
