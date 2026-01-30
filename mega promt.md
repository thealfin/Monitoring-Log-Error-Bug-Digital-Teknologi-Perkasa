# 🚀 MEGA PROMPT: Integrated Bug Tracker & Log Monitoring System
**Version**: 2.0 (Super Detailed Edition)
**Project Entity**: PT. Digital Teknologi Perkasa
**Status**: Active Development (Supabase Integrated)

---

## **1. CORE IDENTITY & BRANDING**
*   **Project Name**: Monitoring Log Error & Bug - Digital Teknologi Perkasa.
*   **Target User**: Internal Engineering & QA Team of PT. Digital Teknologi Perkasa.
*   **Branding Guidelines**:
    *   **Primary Logo**: `media/digitek putih.webp` (Logo putih wajib memiliki container background hitam `#121417` dengan `rounded-2xl` agar kontras di mode terang).
    *   **Typography**: Font **Inter** (skala 300-900) untuk teks profesional, dan **Material Symbols Outlined** untuk ikonografi.
    *   **Color Palette**: 
        *   Primary: Navy Dark (`#001D1A`)
        *   Accent: Brand Green (`#008f80`)
        *   Background: Light (`#f6f7f7`) & Dark (`#16181c`)
    *   **Favicon**: Menggunakan `media/digitek putih.webp`.

---

## **2. TECHNICAL STACK & ARCHITECTURE**
*   **Frontend Architecture**:
    *   Current: Vanilla JS + Tailwind CSS + Supabase Client.
    *   Roadmap: Migrasi ke Expo + React Native + expo-router untuk mobile.
    *   **State Management**: Zustand (Global UI & Role) + TanStack Query (Server State).
*   **Backend & Database (Supabase)**:
    *   **Engine**: PostgreSQL (managed by Supabase).
    *   **Security**: **Row Level Security (RLS)** aktif pada tabel `logs` dan `profiles`.
    *   **Config**: `supabase-config.js`.

---

## **3. IMPLEMENTATION ROADMAP (PHASES)**

### **Fase 0 – Fondasi & Spesifikasi Teknis**
1.  Model data bug log & comment.
2.  RBAC (Editor vs Viewer) di frontend.
3.  Struktur folder scalable untuk frontend & backend.

### **Fase 1 – Backend & Data Model**
*   **BugLog Fields**: `report_number`, `version`, `found_date`, `module`, `priority`, `severity`, `actual_result`, `expected_result`, `status`, `reporter`, `attachments`.
*   **Comment Fields**: `bug_id`, `author`, `content`, `created_at`.

### **Fase 2 – Layout Dasar & Navigasi (Expo Roadmap)**
1.  Setup `expo-router` dengan Tab Navigation: Dashboard, All Logs, Reports.
2.  `AppHeader` tetap dengan `ProfileWidget` (Nama, Avatar, Role Badge).

### **Fase 3 – Design System (Theme) & Komponen Dasar**
*   Warna "kalem" (pastel) untuk status badge:
    *   High/Reject: Red (bg opacity 0.12, text dark).
    *   Medium/Todo: Orange/Amber.
    *   Low/Done: Green/Emerald.

### **Fase 4 – Halaman “All Logs” + Tabel MonitorQA-style**
1.  Tabel dengan hover effects dan horizontal scroll untuk mobile.
2.  Logic RBAC: Editor melihat aksi Edit/Delete, Viewer hanya melihat data.

---

## **4. DETAILED DATA SPECIFICATIONS**

### **Collection/Table: `logs` (BugLog)**
```json
{
  "report_number": "BUG-DTP-001",
  "version": "v1.0.3",
  "found_date": "ISO-8601 Timestamp",
  "module": "Auth / Payment / UI",
  "priority": "high | medium | low",
  "severity": "critical | major | minor",
  "actual_result": "String",
  "expected_result": "String",
  "status": "todo | in_progress | done | rejected",
  "reporter": "String",
  "attachments": [{"label": "String", "url": "String"}]
}
```

---

## **5. UI/UX STANDARDS (DESIGN SYSTEM)**
*   **Interactive States**:
    *   **Hover Row**: Background berubah menjadi abu terang (`#F3F4F6` / `#252525`).
    *   **Caret Bug Fix**: Menonaktifkan seleksi teks pada ikon dan elemen non-teks menggunakan CSS `user-select: none`.
*   **Modals**: Transparan/Blur background dengan animasi scale-in untuk form input.
*   **Alerts**: Notifikasi sukses/error yang elegan.

---

## **6. RBAC RULES (FRONTEND & RLS)**
*   **Editor**:
    *   Bisa Create, Update, Delete log.
    *   UI: Menampilkan tombol "Tambah Log" & ikon aksi.
*   **Viewer**:
    *   Hanya bisa Read & Search.
    *   UI: Tombol manipulasi data disembunyikan.
*   **Diskusi**: Kedua role diperbolehkan menambah komentar.

---

### **Instruksi Operasional AI**:
> *Gunakan dokumen ini sebagai satu-satunya sumber kebenaran (Single Source of Truth) untuk setiap modifikasi kode. Jangan mengubah nama project, logo, atau skema RLS tanpa instruksi eksplisit. Pastikan setiap baris kode baru mematuhi standar desain "Clean & Professional" yang telah ditetapkan.*
