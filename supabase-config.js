// Inisialisasi Supabase Client
let supabaseClient;

function initSupabase() {
    if (typeof supabase === 'undefined') {
        console.warn('Supabase library not loaded yet. Retrying in 100ms...');
        setTimeout(initSupabase, 100);
        return;
    }

    const { createClient } = supabase;
    const supabaseUrl = 'https://tgbzkulmpfdjmjleuyyw.supabase.co';
    const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRnYnprdWxtcGZkam1qbGV1eXl3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk2NzIxNTEsImV4cCI6MjA4NTI0ODE1MX0.MlSXxR2ujt9Xv3H6I4NDfL-2as9YtOjG5VJoyp-q_BE';

    supabaseClient = createClient(supabaseUrl, supabaseKey);
    console.log('Supabase client initialized successfully.');
}

initSupabase();

// Fungsi global untuk proteksi halaman
async function checkAuth() {
    // Tunggu sampai supabaseClient siap
    while (!supabaseClient) {
        await new Promise(resolve => setTimeout(resolve, 100));
    }
    
    const { data: { session }, error } = await supabaseClient.auth.getSession();
    if (error || !session) {
        window.location.href = 'login.html';
        return null;
    }
    return session.user;
}

// Fungsi logout global
async function handleLogout() {
    if (!supabaseClient) return;
    await supabaseClient.auth.signOut();
    window.location.href = 'login.html';
}
