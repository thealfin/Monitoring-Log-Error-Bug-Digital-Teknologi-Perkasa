<!DOCTYPE html>
<html class="light" lang="id"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Tambah Anggota Tim - Pesantren Smart Digital</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
<script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        primary: "#059669",
                        "dark-sidebar": "#001D1A",
                        "background-light": "#F8FAFC",
                        "background-dark": "#0F172A",
                    },
                    fontFamily: {
                        display: ["Inter", "sans-serif"],
                    },
                    borderRadius: {
                        DEFAULT: "0.75rem",
                    },
                },
            },
        };
    </script>
<style>
        body { font-family: 'Inter', sans-serif; }
        .custom-scrollbar::-webkit-scrollbar { width: 6px; }
        .custom-scrollbar::-webkit-scrollbar-track { background: transparent; }
        .custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }
        .dark .custom-scrollbar::-webkit-scrollbar-thumb { background: #334155; }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark text-slate-900 dark:text-slate-100 transition-colors duration-200">
<div class="flex h-screen overflow-hidden">
<aside class="w-64 bg-dark-sidebar flex-shrink-0 flex flex-col h-full hidden lg:flex">
<div class="p-6">
<div class="flex items-center gap-3">
<div class="w-10 h-10 bg-white rounded-lg flex items-center justify-center p-1.5">
<img alt="Logo PSD" class="rounded" src="https://lh3.googleusercontent.com/aida-public/AB6AXuDC3chjhiU1_5tOsbRlxpPqvEXx9yfx32ubOBlViP4KhVb22qVsNtyDVmpScing4inFeO3CxdTDDtj0Bzjpqqd8Yj-6O4TYaEl42cMuJ56j0K0FKpljfSNRNpl1BOY6dhewfJfr0pkIWMycCrTbWQVOlN6PWrF8dmsyYlgYU-2sOQ0dRYCyk16LISrk4fQlrDg1GEXos-qMaWBcp-ksDQntJfdiKhFjSGk9iMxej2Ziq3LdP4UN0_YnNkoYzIsT4n7PSqEUgZe8FOTJ"/>
</div>
<div>
<h1 class="text-white text-sm font-bold leading-tight">Pesantren Smart Digital</h1>
<p class="text-[10px] text-teal-500 font-medium">Bug Tracker &amp; Log Monitoring</p>
</div>
</div>
</div>
<nav class="flex-1 px-4 mt-4 space-y-1">
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-400 hover:text-white rounded-lg transition-all group" href="#">
<span class="material-icons-round text-[20px]">grid_view</span>
<span class="text-sm font-medium">Ringkasan Dashboard</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-400 hover:text-white rounded-lg transition-all group" href="#">
<span class="material-icons-round text-[20px]">assignment</span>
<span class="text-sm font-medium">Manajemen Semua Log</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-400 hover:text-white rounded-lg transition-all group" href="#">
<span class="material-icons-round text-[20px]">assessment</span>
<span class="text-sm font-medium">Laporan &amp; Analitik</span>
</a>
<div class="py-2 border-t border-teal-900/30 my-2"></div>
<a class="flex items-center gap-3 px-3 py-2.5 bg-white/10 text-white rounded-lg transition-all group" href="#">
<span class="material-icons-round text-[20px]">groups</span>
<span class="text-sm font-medium">Manajemen Akses Tim</span>
</a>
<a class="flex items-center gap-3 px-3 py-2.5 text-slate-400 hover:text-white rounded-lg transition-all group" href="#">
<span class="material-icons-round text-[20px]">settings</span>
<span class="text-sm font-medium">Pengaturan Sistem</span>
</a>
</nav>
<div class="p-4 mt-auto border-t border-teal-900/30">
<div class="flex items-center gap-3 p-2">
<div class="w-9 h-9 rounded-full bg-teal-800 flex items-center justify-center text-teal-200">
<span class="material-icons-round text-sm">person</span>
</div>
<div class="flex-1 min-w-0">
<p class="text-xs font-semibold text-white truncate">Ahmad F.</p>
<span class="text-[10px] px-1.5 py-0.5 bg-primary/20 text-primary rounded font-bold uppercase tracking-wider">Editor</span>
</div>
</div>
</div>
</aside>
<main class="flex-1 flex flex-col min-w-0 relative">
<header class="h-16 flex items-center justify-between px-8 bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800">
<div class="flex items-center lg:hidden">
<span class="material-icons-round text-slate-600 dark:text-slate-400">menu</span>
</div>
<div class="flex items-center gap-4 ml-auto">
<button class="w-10 h-10 flex items-center justify-center rounded-full text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-800 relative">
<span class="material-icons-round">notifications</span>
<span class="absolute top-2 right-2.5 w-2 h-2 bg-red-500 rounded-full border-2 border-white dark:border-slate-900"></span>
</button>
<button class="w-10 h-10 flex items-center justify-center rounded-full text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-800">
<span class="material-icons-round">help_outline</span>
</button>
<button class="w-10 h-10 flex items-center justify-center rounded-full text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-800" id="themeToggle">
<span class="material-icons-round dark:hidden">dark_mode</span>
<span class="material-icons-round hidden dark:block">light_mode</span>
</button>
</div>
</header>
<div class="flex-1 p-8 overflow-y-auto custom-scrollbar">
<div class="flex items-center justify-between mb-8">
<div>
<h2 class="text-2xl font-bold text-slate-800 dark:text-white">Manajemen Akses Tim</h2>
<p class="text-slate-500 dark:text-slate-400 mt-1">Kelola anggota tim dan hak akses mereka dalam sistem.</p>
</div>
<button class="bg-primary hover:bg-emerald-700 text-white px-5 py-2.5 rounded-lg font-medium flex items-center gap-2 shadow-lg shadow-emerald-900/10 transition-all">
<span class="material-icons-round text-lg">person_add_alt</span>
                        Tambah Anggota
                    </button>
</div>
<div class="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 overflow-hidden">
<div class="p-4 border-b border-slate-200 dark:border-slate-800 flex flex-wrap gap-4 items-center">
<div class="relative flex-1 min-w-[300px]">
<span class="material-icons-round absolute left-3 top-2.5 text-slate-400">search</span>
<input class="w-full pl-10 pr-4 py-2 bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-lg text-sm focus:ring-primary focus:border-primary" placeholder="Cari anggota tim berdasarkan nama atau email..." type="text"/>
</div>
<select class="bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-lg text-sm px-4 py-2 pr-10 focus:ring-primary">
<option>Semua Peran</option>
</select>
</div>
<div class="overflow-x-auto">
<table class="w-full text-left">
<thead class="bg-slate-50 dark:bg-slate-800/50 text-[11px] font-bold uppercase tracking-wider text-slate-500 dark:text-slate-400">
<tr>
<th class="px-6 py-4">Nama</th>
<th class="px-6 py-4">Email</th>
<th class="px-6 py-4">Peran</th>
<th class="px-6 py-4">Aktif Terakhir</th>
<th class="px-6 py-4 text-right">Aksi</th>
</tr>
</thead>
<tbody class="divide-y divide-slate-100 dark:divide-slate-800">
<tr class="hover:bg-slate-50 dark:hover:bg-slate-800/30 transition-colors">
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="w-8 h-8 rounded-full bg-slate-200 dark:bg-slate-700 overflow-hidden">
<img alt="Ahmad Fauzi" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAnScli87JPuAaWLhxY2vpnsPvVTjNPGA-C3HLbS8lnFIW6pPP_thsm9Pk3EjnwqVcOGRrZacuAI0cm6S7cYkb3A2vs6sDGXq3Md-hH0b_e-zbxTHSWyR0WoAtzQ1NfjoHMoiX3acekEe4OtIcosyybQSiiqAfAzTD4sEKALxT3g3aePNDyQd5w2jUm5UlO-lFgllrqBVeOK8DWEocQZxnJqOUIFDflWyiMYamH_xE0hn9QuIVgU4aIYcG-W28Ng-4kbpAHLB4vZB6K"/>
</div>
<span class="font-medium text-sm">Ahmad Fauzi</span>
</div>
</td>
<td class="px-6 py-4 text-sm text-slate-500 dark:text-slate-400">ahmad.f@pesantren.digital</td>
<td class="px-6 py-4">
<span class="text-[10px] px-2 py-0.5 bg-primary/10 text-primary rounded font-bold uppercase tracking-wider">Editor</span>
</td>
<td class="px-6 py-4 text-sm text-slate-500 dark:text-slate-400">Online sekarang</td>
<td class="px-6 py-4 text-right">
<button class="p-1 text-slate-400 hover:text-primary transition-colors"><span class="material-icons-round text-lg">edit</span></button>
<button class="p-1 text-slate-400 hover:text-red-500 transition-colors"><span class="material-icons-round text-lg">delete</span></button>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div class="fixed inset-0 z-[100] flex items-center justify-center p-4" id="modal-overlay">
<div class="absolute inset-0 bg-slate-900/60 backdrop-blur-sm"></div>
<div class="relative bg-white dark:bg-slate-900 w-full max-w-lg rounded-2xl shadow-2xl shadow-black/20 overflow-hidden transform transition-all animate-in fade-in zoom-in duration-300">
<div class="flex items-center justify-between px-8 py-6 border-b border-slate-100 dark:border-slate-800">
<div>
<h3 class="text-xl font-bold text-slate-900 dark:text-white">Tambah Anggota Tim</h3>
<p class="text-xs text-slate-500 dark:text-slate-400 mt-0.5">Berikan akses ke anggota baru untuk bergabung.</p>
</div>
<button class="w-10 h-10 flex items-center justify-center rounded-full text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800 hover:text-slate-600 transition-all" onclick="document.getElementById('modal-overlay').classList.add('hidden')">
<span class="material-icons-round">close</span>
</button>
</div>
<form class="p-8 space-y-6">
<div class="space-y-5">
<div>
<label class="block text-sm font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Nama Lengkap</label>
<div class="relative">
<span class="material-icons-round absolute left-3 top-3 text-slate-400 text-[20px]">person_outline</span>
<input class="w-full pl-10 pr-4 py-3 bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all" placeholder="Masukkan nama lengkap" type="text"/>
</div>
</div>
<div>
<label class="block text-sm font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Alamat Email</label>
<div class="relative">
<span class="material-icons-round absolute left-3 top-3 text-slate-400 text-[20px]">mail_outline</span>
<input class="w-full pl-10 pr-4 py-3 bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all" placeholder="contoh@pesantren.digital" type="email"/>
</div>
</div>
<div>
<label class="block text-sm font-semibold text-slate-700 dark:text-slate-300 mb-1.5">Kata Sandi</label>
<div class="relative">
<span class="material-icons-round absolute left-3 top-3 text-slate-400 text-[20px]">lock_outline</span>
<input class="w-full pl-10 pr-12 py-3 bg-slate-50 dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all" placeholder="••••••••" type="password"/>
<button class="absolute right-3 top-3 text-slate-400 hover:text-slate-600" type="button">
<span class="material-icons-round text-[20px]">visibility</span>
</button>
</div>
</div>
<div>
<label class="block text-sm font-semibold text-slate-700 dark:text-slate-300 mb-3">Pilih Role Akses</label>
<div class="grid grid-cols-2 gap-4">
<label class="relative flex flex-col p-4 bg-slate-50 dark:bg-slate-800 border-2 border-primary rounded-xl cursor-pointer ring-2 ring-primary/10">
<input checked="" class="sr-only" name="role" type="radio" value="editor"/>
<div class="flex items-center justify-between mb-2">
<span class="text-xs font-bold uppercase tracking-wider text-primary">Editor</span>
<div class="w-5 h-5 rounded-full border-4 border-primary bg-white flex items-center justify-center"></div>
</div>
<p class="text-[11px] text-slate-500 dark:text-slate-400 leading-relaxed">Bisa menambah dan mengedit log sistem.</p>
</label>
<label class="relative flex flex-col p-4 bg-slate-50 dark:bg-slate-800 border-2 border-transparent hover:border-slate-200 dark:hover:border-slate-700 rounded-xl cursor-pointer transition-all">
<input class="sr-only" name="role" type="radio" value="viewer"/>
<div class="flex items-center justify-between mb-2">
<span class="text-xs font-bold uppercase tracking-wider text-slate-400 dark:text-slate-500">Viewer</span>
<div class="w-5 h-5 rounded-full border-2 border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-900"></div>
</div>
<p class="text-[11px] text-slate-500 dark:text-slate-400 leading-relaxed">Hanya bisa melihat dan memberi komentar.</p>
</label>
</div>
</div>
</div>
<div class="flex gap-3 pt-2">
<button class="flex-1 py-3 px-4 text-sm font-semibold text-slate-600 dark:text-slate-400 hover:bg-slate-100 dark:hover:bg-slate-800 rounded-xl transition-all" onclick="document.getElementById('modal-overlay').classList.add('hidden')" type="button">
                                Batal
                            </button>
<button class="flex-1 py-3 px-4 text-sm font-semibold bg-dark-sidebar dark:bg-primary text-white hover:opacity-90 rounded-xl transition-all shadow-lg shadow-black/10" type="submit">
                                Simpan Akses
                            </button>
</div>
</form>
</div>
</div>
</main>
</div>
<script>
        const themeToggle = document.getElementById('themeToggle');
        const html = document.documentElement;
        themeToggle.addEventListener('click', () => {
            if (html.classList.contains('dark')) {
                html.classList.remove('dark');
                html.classList.add('light');
            } else {
                html.classList.remove('light');
                html.classList.add('dark');
            }
        });
        // Simple Role Selection UI Logic
        const roleInputs = document.querySelectorAll('input[name="role"]');
        roleInputs.forEach(input => {
            input.addEventListener('change', () => {
                roleInputs.forEach(item => {
                    const label = item.closest('label');
                    const radioCircle = label.querySelector('div.rounded-full');
                    const roleTitle = label.querySelector('span');
                    if (item.checked) {
                        label.classList.add('border-primary', 'ring-2', 'ring-primary/10');
                        label.classList.remove('border-transparent', 'hover:border-slate-200', 'dark:hover:border-slate-700');
                        radioCircle.classList.add('border-4', 'border-primary');
                        radioCircle.classList.remove('border-2', 'border-slate-200', 'dark:border-slate-700');
                        roleTitle.classList.add('text-primary');
                        roleTitle.classList.remove('text-slate-400', 'dark:text-slate-500');
                    } else {
                        label.classList.remove('border-primary', 'ring-2', 'ring-primary/10');
                        label.classList.add('border-transparent', 'hover:border-slate-200', 'dark:hover:border-slate-700');
                        radioCircle.classList.remove('border-4', 'border-primary');
                        radioCircle.classList.add('border-2', 'border-slate-200', 'dark:border-slate-700');
                        roleTitle.classList.remove('text-primary');
                        roleTitle.classList.add('text-slate-400', 'dark:text-slate-500');
                    }
                });
            });
        });
    </script>

</body></html>