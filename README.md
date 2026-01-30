# 🐞 Monitoring Log Error & Bug - PT. Digital Teknologi Perkasa

Sistem pencatatan bug dan monitoring log terintegrasi untuk ekosistem yang ada di PT. Digital Teknologi Perkasa. Dirancang untuk mempercepat identifikasi masalah dan kolaborasi tim secara real-time.

## ✨ Fitur Utama
- **Role-Based Access**: Pembedaan hak akses antara Editor dan Viewer.
- **Real-time Dashboard**: Ringkasan log terbaru dengan status yang jelas.
- **Advanced Pagination**: Manajemen data besar yang ringan dan cepat (20, 50, 100 baris per halaman).
- **Security First**: Keamanan data menggunakan Supabase Row Level Security (RLS).
- **Dark Mode Support**: Antarmuka yang nyaman untuk penggunaan siang maupun malam hari.
- **Multi-language**: Mendukung Bahasa Indonesia, Inggris, dan Arab.

## 🚀 Teknologi yang Digunakan
- **Frontend**: HTML5, Tailwind CSS, JavaScript (Vanilla)
- **Database & Auth**: [Supabase](https://supabase.com/)
- **Icons**: [Material Symbols](https://fonts.google.com/icons)

## ⚙️ Persiapan Lokal
1. Pastikan Anda memiliki akun [Supabase](https://supabase.com/).
2. Buat tabel `logs` dan `profiles` di database Supabase Anda.
3. Gunakan template SQL RLS untuk mengamankan data Anda.
4. Masukkan URL dan Key Supabase Anda ke dalam file `supabase-config.js`.
5. Buka `index.html` di browser Anda.

## 🔒 Keamanan (RLS)
Sangat disarankan untuk mengaktifkan **Row Level Security (RLS)** pada tabel `logs` dan `profiles` di dashboard Supabase agar data tidak dapat diakses secara ilegal meskipun API Key terekspos.

---
© 2026 PT. Digital Teknologi Perkasa. All rights reserved.
