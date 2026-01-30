<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title id="doc-title">Pesantren Smart Digital - Integrated Dashboard</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com" rel="preconnect"/>
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
    <style type="text/tailwindcss">
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            font-size: 24px;
        }
        .icon-fill {
            font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        :root {
            --sidebar-color: #001D1A;
        }
        .custom-scrollbar::-webkit-scrollbar {
            height: 8px; width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 10px;
        }
        .dark .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #334155;
        }
        .nav-active {
            @apply bg-white/10 text-white;
        }
        .nav-inactive {
            @apply text-gray-400 hover:bg-white/5 hover:text-white transition-colors;
        }
        
        /* Status Badges */
        .badge-status-report { @apply bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400 border border-yellow-200; }
        .badge-status-todo { @apply bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400 border border-blue-200; }
        .badge-status-done { @apply bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400 border border-green-200; }
        .badge-status-reject { @apply bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400 border border-red-200; }
        
        /* Priority Badges */
        .badge-prio-rendah { @apply bg-yellow-50 text-yellow-600 dark:bg-yellow-900/10 dark:text-yellow-500 border border-yellow-200/50; }
        .badge-prio-sedang { @apply bg-orange-100 text-orange-700 dark:bg-orange-900/20 dark:text-orange-400 border border-orange-200/50; }
        .badge-prio-tinggi { @apply bg-red-100 text-red-700 dark:bg-red-900/20 dark:text-red-400 border border-red-200/50; }

        /* Chat Bubbles */
        .bubble-other { @apply bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-gray-200 rounded-2xl rounded-tl-none p-4 max-w-[85%]; }
        .bubble-me { @apply bg-emerald-600 text-white rounded-2xl rounded-tr-none p-4 max-w-[85%] self-end; }
    </style>
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#001D1A",
                        "background-light": "#f6f7f7",
                        "background-dark": "#16181c",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-background-light dark:bg-background-dark font-display text-[#121417] overflow-hidden">
    <div class="flex h-screen w-full">
        <!-- SIDEBAR -->
        <aside id="sidebar" class="fixed inset-y-0 left-0 z-50 w-72 bg-[var(--sidebar-color)] text-white border-r border-white/5 transform -translate-x-full md:translate-x-0 md:relative transition-transform duration-300 ease-in-out flex flex-col">
            <div class="p-6 flex items-center gap-3">
                <div class="bg-center bg-no-repeat aspect-square bg-cover rounded-lg size-10 shadow-lg border border-white/10" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuApMLl25c-NRgpYpUcO6Tsui_YcY4tJzjKCKGReK9lhoBM-0R1Fr-07VWayvtK_GRk7TKb1uW-ezRHrZE7C6x4Epg2WTsYLCqeKmCk-9hIvhm_c3kJ3KMPPQ_XkDaq54srSSDx7TvoVZmS9Ujq8JyAFEUAl5tIC1GJ1bvuXDBmMjvdUTr5ntBiKqtyZuO9N8wyrsfKNtEMEzKn_pi9mUOumfnBkcMFOEeMGw3K21u59nV8H6zMwGONrsPCDYyVuv8WUFN6X386ltXfw");'></div>
                <div class="flex flex-col">
                    <h1 id="sidebar-app-name" class="text-white text-base font-bold leading-tight">Pesantren Smart Digital</h1>
                    <p class="text-emerald-500/80 text-xs font-normal">Bug Tracker <br> & Log Monitoring</p>
                </div>
            </div>
            <div class="flex-1 px-4 py-4 flex flex-col gap-2 overflow-y-auto custom-scrollbar">
                <button onclick="navigateTo('dashboard')" id="nav-dashboard" class="nav-item flex items-center gap-3 px-4 py-3 rounded-xl nav-active text-left w-full">
                    <span class="material-symbols-outlined">dashboard</span>
                    <p class="text-sm font-medium">Dashboard</p>
                </button>
                <button onclick="navigateTo('all-logs')" id="nav-all-logs" class="nav-item flex items-center gap-3 px-4 py-3 rounded-xl nav-inactive text-left w-full">
                    <span class="material-symbols-outlined">description</span>
                    <p class="text-sm font-medium">All Logs</p>
                </button>
                <button onclick="navigateTo('reports')" id="nav-reports" class="nav-item flex items-center gap-3 px-4 py-3 rounded-xl nav-inactive text-left w-full">
                    <span class="material-symbols-outlined">analytics</span>
                    <p class="text-sm font-medium">Reports</p>
                </button>
                <div class="h-px bg-white/10 my-2 mx-4"></div>
                <button onclick="navigateTo('settings')" id="nav-settings" class="nav-item flex items-center gap-3 px-4 py-3 rounded-xl nav-inactive text-left w-full">
                    <span class="material-symbols-outlined">settings</span>
                    <p class="text-sm font-medium">Settings</p>
                </button>
                <button onclick="navigateTo('team')" id="nav-team" class="nav-item flex items-center gap-3 px-4 py-3 rounded-xl nav-inactive text-left w-full">
                    <span class="material-symbols-outlined">group</span>
                    <p class="text-sm font-medium">Team Access</p>
                </button>
            </div>
            <div class="p-4 border-t border-white/10">
                <div class="flex items-center gap-3 px-2 py-2">
                    <div class="bg-center bg-no-repeat bg-cover rounded-full size-10 border-2 border-white/20" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCgY94Yk_belSnRWNdZFLvhY4AgzODMQtKHrsME9W0EAbVyJc595T8JJ-fQiRu-nxBI3ghgL_Hsxwf5M-UmYYZxb8d6xsTRqFY25Qd8ab8i-6s2nncqa4FuMcNPxlOkbISoM0wvhXVIaegXon7QdEEqN5JXZotmzpcGmw8ivZ1PaG3w0AENUL0sBqGsHRcztMqtBWGHsxZQulLpk_qSGU0gdWc-Ymv17NGq_3IMz0YxJ-M2DjuYufrTAMU7I7F5nKukrl");'></div>
                    <div class="flex flex-col min-w-0">
                        <p class="text-white text-sm font-medium truncate">Ahmad F.</p>
                        <div class="flex items-center gap-1">
                            <select id="roleSelector" onchange="updateRole(this.value)" class="bg-emerald-500/20 text-emerald-300 text-[10px] px-1.5 py-0.5 rounded border border-emerald-500/30 font-semibold uppercase cursor-pointer outline-none appearance-none">
                                <option value="Editor" class="bg-[#001D1A]">Editor</option>
                                <option value="Viewer" class="bg-[#001D1A]">Viewer</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </aside>

        <!-- MAIN CONTENT AREA -->
        <main class="flex-1 flex flex-col h-full overflow-hidden bg-background-light dark:bg-background-dark relative">
            <!-- HEADER -->
            <header class="flex items-center justify-between px-6 py-4 bg-white dark:bg-[#1e1e1e] border-b border-[#ebedef] dark:border-gray-800 shrink-0 z-20">
                <div class="flex items-center gap-4">
                    <button onclick="toggleSidebar()" class="md:hidden p-2 text-gray-600 dark:text-gray-300">
                        <span class="material-symbols-outlined">menu</span>
                    </button>
                    <h2 id="page-title" class="text-[#121417] dark:text-white text-lg font-bold leading-tight tracking-[-0.015em] hidden sm:block">
                        Dashboard Overview
                    </h2>
                </div>
                <div class="flex items-center gap-2 sm:gap-4">
                    <button class="flex h-10 w-10 items-center justify-center rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 transition-colors relative">
                        <span class="material-symbols-outlined">notifications</span>
                        <span class="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full border border-white dark:border-[#1e1e1e]"></span>
                    </button>
                    <button class="flex h-10 w-10 items-center justify-center rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 transition-colors">
                        <span class="material-symbols-outlined">help</span>
                    </button>
                    <div class="h-6 w-px bg-gray-200 dark:bg-gray-700 mx-1 hidden sm:block"></div>
                    <button class="flex h-10 w-10 items-center justify-center rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 transition-colors" onclick="document.documentElement.classList.toggle('dark')">
                        <span class="material-symbols-outlined dark:hidden">dark_mode</span>
                        <span class="material-symbols-outlined hidden dark:block">light_mode</span>
                    </button>
                </div>
            </header>

            <!-- DYNAMIC PAGE CONTAINER -->
            <div id="content-container" class="flex-1 overflow-y-auto custom-scrollbar p-6 md:p-8">
                <!-- Content injected here -->
            </div>
        </main>
    </div>

    <!-- TEMPLATES -->

    <!-- DASHBOARD TEMPLATE -->
    <template id="tpl-dashboard">
        <div class="max-w-7xl mx-auto space-y-8 animate-in fade-in duration-500">
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div class="flex flex-col gap-1">
                    <h2 class="text-[#121417] dark:text-white text-3xl font-extrabold leading-tight tracking-tight">Dashboard Overview</h2>
                    <p class="text-[#646f82] dark:text-gray-400 text-base font-normal">Selamat datang kembali di <span class="app-name-display font-bold"></span>, <span class="current-role-label font-bold"></span> Ahmad F.</p>
                </div>
                <div class="flex gap-3 role-editor-only">
                    <button onclick="navigateTo('import-log')" class="flex items-center justify-center gap-2 h-11 px-5 rounded-lg bg-white dark:bg-[#252525] border border-gray-200 dark:border-gray-700 text-[#121417] dark:text-white text-sm font-semibold shadow-sm hover:bg-gray-50 dark:hover:bg-[#2a2a2a] transition-all">
                        <span class="material-symbols-outlined text-[20px]">file_upload</span>
                        <span>Import New Log</span>
                    </button>
                    <button onclick="navigateTo('add-log')" class="flex items-center justify-center gap-2 h-11 px-5 rounded-lg bg-[var(--sidebar-color)] hover:opacity-90 text-white text-sm font-semibold shadow-md transition-all">
                        <span class="material-symbols-outlined text-[20px]">add</span>
                        <span>Add New Log</span>
                    </button>
                </div>
            </div>
            
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                <div class="flex flex-col gap-3 rounded-xl p-5 bg-white dark:bg-[#1e1e1e] border border-gray-200 dark:border-gray-800 shadow-sm">
                    <div class="flex items-center justify-between">
                        <div class="p-2 bg-blue-50 dark:bg-blue-900/20 rounded-lg"><span class="material-symbols-outlined text-blue-600">bug_report</span></div>
                        <span class="text-xs font-bold badge-status-report px-2 py-0.5 rounded">Total</span>
                    </div>
                    <div><p class="text-gray-500 dark:text-gray-400 text-xs">Total Log</p><p class="total-count text-[#121417] dark:text-white text-2xl font-bold">0</p></div>
                </div>
                <div class="flex flex-col gap-3 rounded-xl p-5 bg-white dark:bg-[#1e1e1e] border border-gray-200 dark:border-gray-800 shadow-sm">
                    <div class="flex items-center justify-between">
                        <div class="p-2 bg-orange-50 dark:bg-orange-900/20 rounded-lg"><span class="material-symbols-outlined text-orange-600">pending_actions</span></div>
                        <span class="text-xs font-bold badge-status-todo px-2 py-0.5 rounded">Aktif</span>
                    </div>
                    <div><p class="text-gray-500 dark:text-gray-400 text-xs">To Do</p><p class="todo-count text-[#121417] dark:text-white text-2xl font-bold">0</p></div>
                </div>
                <div class="flex flex-col gap-3 rounded-xl p-5 bg-white dark:bg-[#1e1e1e] border border-gray-200 dark:border-gray-800 shadow-sm">
                    <div class="flex items-center justify-between">
                        <div class="p-2 bg-green-50 dark:bg-green-900/20 rounded-lg"><span class="material-symbols-outlined text-green-600">check_circle</span></div>
                        <span class="text-xs font-bold badge-status-done px-2 py-0.5 rounded">Selesai</span>
                    </div>
                    <div><p class="text-gray-500 dark:text-gray-400 text-xs">Resolved</p><p class="done-count text-[#121417] dark:text-white text-2xl font-bold">0</p></div>
                </div>
                <div class="flex flex-col gap-3 rounded-xl p-5 bg-white dark:bg-[#1e1e1e] border border-gray-200 dark:border-gray-800 shadow-sm">
                    <div class="flex items-center justify-between">
                        <div class="p-2 bg-red-50 dark:bg-red-900/20 rounded-lg"><span class="material-symbols-outlined text-red-600">dangerous</span></div>
                        <span class="text-xs font-bold badge-status-reject px-2 py-0.5 rounded">Ditolak</span>
                    </div>
                    <div><p class="text-gray-500 dark:text-gray-400 text-xs">Reject</p><p class="reject-count text-[#121417] dark:text-white text-2xl font-bold">0</p></div>
                </div>
            </div>

            <div class="bg-white dark:bg-[#1e1e1e] rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm overflow-hidden">
                <div class="px-6 py-5 border-b border-gray-100 dark:border-gray-800 flex justify-between items-center">
                    <h3 class="text-lg font-bold text-[#121417] dark:text-white">Daftar Bug & Error Terbaru</h3>
                    <button onclick="navigateTo('all-logs')" class="text-emerald-500 text-xs font-bold hover:underline">Lihat Semua</button>
                </div>
                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left border-collapse min-w-[1400px]">
                        <thead>
                            <tr class="bg-gray-50 dark:bg-[#252525] border-b border-gray-200 dark:border-gray-800 text-[11px] font-bold text-gray-500 uppercase tracking-wider">
                                <th class="px-4 py-4 text-center">No. Lap</th>
                                <th class="px-4 py-4">Versi</th>
                                <th class="px-4 py-4">Tanggal</th>
                                <th class="px-4 py-4">Modul</th>
                                <th class="px-4 py-4">Priority</th>
                                <th class="px-4 py-4">Status</th>
                                <th class="px-4 py-4">Pelapor</th>
                                <th class="px-4 py-4 text-right sticky right-0 bg-gray-50 dark:bg-[#252525]">Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="dashboard-table-body" class="divide-y divide-gray-100 dark:divide-gray-800 text-sm">
                            <!-- Data injected here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </template>

    <!-- ALL LOGS TEMPLATE -->
    <template id="tpl-all-logs">
        <div class="flex flex-col h-full animate-in fade-in duration-500">
            <div class="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6">
                <div class="flex flex-col gap-1">
                    <h2 class="text-[#121417] dark:text-white text-2xl font-extrabold tracking-tight">All Logs Management</h2>
                    <p class="text-gray-500 dark:text-gray-400 text-sm">Comprehensive list of all tracked bugs, errors, and system logs.</p>
                </div>
                <div class="flex gap-3">
                    <button class="flex items-center justify-center gap-2 h-10 px-4 rounded-lg bg-white dark:bg-[#252525] border border-gray-200 dark:border-gray-700 text-[#121417] dark:text-white text-sm font-semibold shadow-sm hover:bg-gray-50 transition-all">
                        <span class="material-symbols-outlined text-[20px]">file_download</span>
                        <span>Export CSV</span>
                    </button>
                    <button onclick="navigateTo('add-log')" class="flex items-center justify-center gap-2 h-10 px-5 rounded-lg bg-[var(--sidebar-color)] hover:bg-[#002d28] text-white text-sm font-semibold shadow-md transition-all role-editor-only">
                        <span class="material-symbols-outlined text-[20px]">add</span>
                        <span>Add New Log</span>
                    </button>
                </div>
            </div>

            <div class="bg-white dark:bg-[#1e1e1e] p-3 rounded-t-xl border border-gray-200 dark:border-gray-800 flex flex-col md:flex-row gap-3 items-center">
                <div class="flex-1 w-full relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-gray-400 text-[20px]">search</span>
                    </div>
                    <input id="log-search" oninput="renderAllLogs()" class="block w-full pl-10 pr-3 py-2 bg-gray-50 dark:bg-[#252525] border border-gray-200 dark:border-gray-700 rounded-lg text-sm placeholder-gray-500 focus:ring-2 focus:ring-emerald-500/20" placeholder="Search by ID, Module, or Reporter..." type="text"/>
                </div>
                <div class="flex gap-2 w-full md:w-auto">
                    <select id="filter-status" onchange="renderAllLogs()" class="bg-gray-50 dark:bg-[#252525] border-gray-200 dark:border-gray-700 text-sm rounded-lg px-3 py-2">
                        <option value="all">Status: All</option>
                        <option value="report">Report</option>
                        <option value="todo">To Do</option>
                        <option value="done">Done</option>
                        <option value="reject">Reject</option>
                    </select>
                </div>
            </div>

            <div class="flex-1 overflow-hidden bg-white dark:bg-[#1e1e1e] border-x border-b border-gray-200 dark:border-gray-800 shadow-sm rounded-b-xl flex flex-col">
                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left border-collapse min-w-[1400px]">
                        <thead>
                            <tr class="bg-gray-50 dark:bg-[#252525] border-b border-gray-200 dark:border-gray-800">
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">No</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Version</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Date</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Module</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Priority</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Status</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider">Reporter</th>
                                <th class="px-4 py-3.5 text-xs font-bold text-gray-500 dark:text-gray-400 uppercase tracking-wider text-right sticky right-0 bg-gray-50 dark:bg-[#252525]">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="all-logs-table-body" class="divide-y divide-gray-100 dark:divide-gray-800 text-sm">
                            <!-- Data injected here -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </template>

    <!-- LOG DETAIL / FORUM TEMPLATE -->
    <template id="tpl-log-detail">
        <div class="max-w-7xl mx-auto space-y-6 animate-in slide-in-from-right-4 duration-300">
            <!-- Back Button -->
            <div class="flex items-center justify-between">
                <button onclick="navigateTo('dashboard')" class="flex items-center gap-2 text-sm text-gray-500 hover:text-emerald-600 transition-colors">
                    <span class="material-symbols-outlined text-sm">arrow_back</span> Kembali
                </button>
                <div id="detail-actions" class="role-editor-only">
                    <!-- Dynamic edit button injected here -->
                </div>
            </div>

            <!-- Log Summary Header Card -->
            <div class="bg-white dark:bg-[#1e1e1e] rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm overflow-hidden">
                <div class="bg-gray-50 dark:bg-[#252525] px-6 py-4 border-b border-gray-200 dark:border-gray-800 flex flex-wrap items-center gap-4">
                    <div class="flex items-center gap-3 mr-auto">
                        <span id="detail-id" class="text-xl font-black text-emerald-600">#---</span>
                        <h2 id="detail-module" class="text-xl font-bold dark:text-white">---</h2>
                    </div>
                    <div id="detail-status" class="px-3 py-1 rounded-full text-xs font-bold uppercase">---</div>
                    <div id="detail-priority" class="px-3 py-1 rounded-full text-xs font-bold uppercase">---</div>
                </div>
                <div class="p-6 grid grid-cols-1 md:grid-cols-4 gap-6 border-b border-gray-100 dark:border-gray-800">
                    <div class="space-y-1">
                        <p class="text-[10px] uppercase tracking-widest text-gray-400 font-bold">Versi Sistem</p>
                        <p id="detail-version" class="text-sm font-semibold dark:text-gray-200">---</p>
                    </div>
                    <div class="space-y-1">
                        <p class="text-[10px] uppercase tracking-widest text-gray-400 font-bold">Tanggal Ditemukan</p>
                        <p id="detail-date" class="text-sm font-semibold dark:text-gray-200">---</p>
                    </div>
                    <div class="space-y-1">
                        <p class="text-[10px] uppercase tracking-widest text-gray-400 font-bold">Keparahan</p>
                        <p id="detail-severity" class="text-sm font-semibold dark:text-gray-200 text-orange-500">---</p>
                    </div>
                    <div class="space-y-1">
                        <p class="text-[10px] uppercase tracking-widest text-gray-400 font-bold">Pelapor</p>
                        <div class="flex items-center gap-2">
                             <div class="size-6 rounded-full bg-emerald-500 text-[10px] flex items-center justify-center text-white font-bold">AF</div>
                             <p id="detail-reporter" class="text-sm font-semibold dark:text-gray-200">---</p>
                        </div>
                    </div>
                </div>
                <div class="p-6 grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="space-y-3 p-4 bg-red-50/30 dark:bg-red-900/10 rounded-xl border border-red-100 dark:border-red-900/20">
                        <h4 class="text-xs font-bold text-red-600 flex items-center gap-2">
                            <span class="material-symbols-outlined text-sm">error</span> Hasil Aktual
                        </h4>
                        <p id="detail-actual" class="text-sm text-gray-600 dark:text-gray-300 leading-relaxed italic">---</p>
                    </div>
                    <div class="space-y-3 p-4 bg-emerald-50/30 dark:bg-emerald-900/10 rounded-xl border border-emerald-100 dark:border-emerald-900/20">
                        <h4 class="text-xs font-bold text-emerald-600 flex items-center gap-2">
                            <span class="material-symbols-outlined text-sm">check_circle</span> Hasil yang Diharapkan
                        </h4>
                        <p id="detail-expected" class="text-sm text-gray-600 dark:text-gray-300 leading-relaxed italic">---</p>
                    </div>
                </div>
                <div class="px-6 py-4 bg-gray-50/50 dark:bg-[#252525]/50 flex items-center justify-between border-t border-gray-200 dark:border-gray-800">
                    <div class="flex items-center gap-2 text-sm text-gray-500">
                        <span class="material-symbols-outlined text-sm">attachment</span>
                        <span>Lampiran Bukti:</span>
                        <a id="detail-attachment" href="#" target="_blank" class="text-blue-500 font-medium hover:underline">Lihat Lampiran</a>
                    </div>
                </div>
            </div>

            <!-- FORUM / DISCUSSION AREA -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                <!-- Comments Column -->
                <div class="lg:col-span-2 space-y-4">
                    <div class="flex items-center gap-2 mb-2">
                        <h3 class="text-lg font-bold dark:text-white">Forum Diskusi</h3>
                        <span class="px-2 py-0.5 bg-gray-200 dark:bg-gray-700 rounded-md text-[10px] font-bold dark:text-gray-300">3 Pesan</span>
                    </div>
                    
                    <div id="discussion-bubbles" class="space-y-6 flex flex-col">
                        <!-- Messages injected here -->
                    </div>

                    <!-- Comment Input -->
                    <div class="bg-white dark:bg-[#1e1e1e] p-4 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm mt-8">
                        <div class="flex gap-4">
                            <div class="size-10 rounded-full bg-[var(--sidebar-color)] shrink-0 flex items-center justify-center text-white font-bold text-sm">AF</div>
                            <div class="flex-1 space-y-3">
                                <textarea id="comment-input" rows="3" class="w-full bg-gray-50 dark:bg-gray-800 border-gray-100 dark:border-gray-700 rounded-xl text-sm dark:text-white focus:ring-emerald-500 p-3" placeholder="Tuliskan komentar atau instruksi untuk tim..."></textarea>
                                <div class="flex justify-end gap-2">
                                    <button class="p-2 text-gray-400 hover:text-emerald-500 transition-colors"><span class="material-symbols-outlined">attachment</span></button>
                                    <button onclick="postComment()" class="bg-emerald-600 hover:bg-emerald-500 text-white px-6 py-2 rounded-lg text-sm font-bold shadow-lg shadow-emerald-900/20 transition-all">Kirim Komentar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Log Activity -->
                <div class="space-y-6">
                    <div class="bg-white dark:bg-[#1e1e1e] p-6 rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm">
                        <h3 class="text-sm font-bold dark:text-white mb-4 flex items-center gap-2">
                            <span class="material-symbols-outlined text-sm">history</span> Riwayat Aktivitas
                        </h3>
                        <div class="space-y-6 relative before:absolute before:inset-0 before:left-3 before:border-l-2 before:border-gray-100 dark:before:border-gray-800">
                            <div class="relative pl-8">
                                <span class="absolute left-[3px] top-1 size-5 rounded-full bg-emerald-500 border-4 border-white dark:border-[#1e1e1e]"></span>
                                <p class="text-xs font-bold dark:text-gray-200">Log Dilaporkan</p>
                                <p class="text-[10px] text-gray-400">Oleh Ahmad F. • 24 Nov, 10:20</p>
                            </div>
                            <div class="relative pl-8">
                                <span class="absolute left-[3px] top-1 size-5 rounded-full bg-blue-500 border-4 border-white dark:border-[#1e1e1e]"></span>
                                <p class="text-xs font-bold dark:text-gray-200">Status berubah ke TO DO</p>
                                <p class="text-[10px] text-gray-400">Oleh Editor • 24 Nov, 11:45</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </template>

    <!-- EDIT LOG TEMPLATE -->
    <template id="tpl-edit-log">
        <div class="max-w-5xl mx-auto animate-in slide-in-from-top-4 duration-300">
            <div class="flex items-center justify-between mb-6">
                <button onclick="history.back()" class="flex items-center gap-2 text-sm text-gray-500 hover:text-emerald-600 transition-colors">
                    <span class="material-symbols-outlined text-sm">arrow_back</span> Kembali
                </button>
                <h2 id="edit-header-title" class="text-lg font-bold dark:text-white uppercase tracking-wider">Edit Log #---</h2>
            </div>
            
            <form id="edit-log-form" onsubmit="event.preventDefault(); saveLogUpdate();" class="space-y-8 bg-white dark:bg-[#1e1e1e] rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm overflow-hidden">
                <div class="bg-gray-50 dark:bg-[#252525] px-8 py-6 border-b border-gray-200 dark:border-gray-800">
                    <h3 class="text-lg font-bold dark:text-white">Modifikasi Data Log</h3>
                    <p class="text-sm text-gray-500">Perbarui informasi laporan temuan bug di bawah ini.</p>
                </div>
                <div class="p-8 space-y-6">
                    <input type="hidden" id="edit-log-id-internal">
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">No. Laporan</label>
                            <input id="edit-no-lap" type="number" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white" readonly/>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Versi</label>
                            <input id="edit-versi" type="text" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"/>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Tanggal Temuan</label>
                            <input id="edit-tanggal" type="datetime-local" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"/>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Modul / Area</label>
                            <input id="edit-modul" type="text" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"/>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Priority</label>
                            <select id="edit-priority" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white">
                                <option value="rendah">🟡 Rendah</option>
                                <option value="sedang">🟠 Sedang</option>
                                <option value="tinggi">🔴 Tinggi</option>
                            </select>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Keparahan</label>
                            <input id="edit-severity" type="text" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"/>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Hasil Aktual</label>
                            <textarea id="edit-aktual" rows="4" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"></textarea>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Harapan</label>
                            <textarea id="edit-harapan" rows="4" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"></textarea>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Status</label>
                            <select id="edit-status" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white">
                                <option value="report">🟡 Report</option>
                                <option value="todo">🔵 To Do</option>
                                <option value="done">🟢 Done</option>
                                <option value="reject">🔴 Reject</option>
                            </select>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Pelapor</label>
                            <input id="edit-pelapor" type="text" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"/>
                        </div>
                        <div class="space-y-2">
                            <label class="text-sm font-semibold dark:text-gray-300">Link Lampiran</label>
                            <input id="edit-lampiran" type="url" class="w-full rounded-lg border-gray-200 dark:bg-[#252525] dark:border-gray-700 dark:text-white"/>
                        </div>
                    </div>
                    <div class="flex justify-end gap-3 pt-6 border-t border-gray-100 dark:border-gray-800">
                        <button type="button" onclick="history.back()" class="px-6 py-2.5 rounded-lg border border-gray-200 dark:text-white text-sm font-semibold hover:bg-gray-50 transition-all">Batal</button>
                        <button type="submit" class="px-8 py-2.5 rounded-lg bg-emerald-600 text-white text-sm font-bold shadow-lg shadow-emerald-900/20 hover:bg-emerald-500 transition-all">Simpan Perubahan</button>
                    </div>
                </div>
            </form>
        </div>
    </template>

    <!-- SETTINGS TEMPLATE -->
    <template id="tpl-settings">
        <div class="max-w-4xl mx-auto space-y-6 animate-in slide-in-from-bottom-4 duration-300">
            <div>
                <h1 class="text-2xl font-extrabold text-[#121417] dark:text-white">Settings</h1>
                <p class="text-gray-500 dark:text-gray-400 mt-1">Manage your application preferences and configuration.</p>
            </div>
            
            <section class="bg-white dark:bg-[#1c1f26] rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm overflow-hidden">
                <div class="px-6 py-5 border-b border-gray-100 dark:border-gray-800">
                    <h3 class="text-lg font-bold text-[#121417] dark:text-white flex items-center gap-2">
                        <span class="material-symbols-outlined text-gray-400">info</span> General Information
                    </h3>
                </div>
                <div class="p-6">
                    <div class="max-w-sm">
                        <label class="block text-sm font-semibold text-[#121417] dark:text-white mb-2" for="app-name-input">Log Name / Project Title</label>
                        <div class="flex gap-2">
                            <input id="app-name-input" type="text" class="flex-1 bg-gray-50 dark:bg-gray-800 border-gray-200 dark:border-gray-700 rounded-lg py-2 px-3 text-sm text-gray-900 dark:text-white" placeholder="Log Name...">
                            <button onclick="saveAppName()" class="bg-emerald-600 text-white px-4 py-2 rounded-lg text-sm font-bold">Update</button>
                        </div>
                    </div>
                </div>
            </section>

            <section class="bg-white dark:bg-[#1c1f26] rounded-2xl border border-gray-200 dark:border-gray-800 shadow-sm overflow-hidden">
                <div class="px-6 py-5 border-b border-gray-100 dark:border-gray-800">
                    <h3 class="text-lg font-bold text-[#121417] dark:text-white flex items-center gap-2">
                        <span class="material-symbols-outlined text-gray-400">palette</span> Appearance
                    </h3>
                </div>
                <div class="p-6 space-y-6">
                    <div class="flex items-center justify-between">
                        <div class="flex flex-col">
                            <span class="text-sm font-semibold text-[#121417] dark:text-white">Interface Theme</span>
                            <span class="text-xs text-gray-500 dark:text-gray-400">Customize how the application looks to you.</span>
                        </div>
                        <div class="flex items-center p-1 bg-gray-100 dark:bg-gray-800 rounded-lg">
                            <button onclick="document.documentElement.classList.remove('dark')" class="flex items-center gap-2 px-3 py-1.5 rounded-md bg-white dark:bg-transparent dark:text-gray-400 text-sm font-medium text-gray-900 shadow-sm transition-all">
                                <span class="material-symbols-outlined text-[18px]">light_mode</span> Light
                            </button>
                            <button onclick="document.documentElement.classList.add('dark')" class="flex items-center gap-2 px-3 py-1.5 rounded-md text-gray-500 dark:bg-gray-700 dark:text-white hover:text-gray-900 text-sm font-medium transition-all">
                                <span class="material-symbols-outlined text-[18px]">dark_mode</span> Dark
                            </button>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </template>

    <!-- (Keep other existing templates like team, add-log, import-log...) -->
    <template id="tpl-team">
        <div class="max-w-7xl mx-auto space-y-8 p-4">Halaman Team Access</div>
    </template>
    <template id="tpl-add-log">
        <div class="max-w-7xl mx-auto space-y-8 p-4">Halaman Add Log Baru</div>
    </template>
    <template id="tpl-import-log">
        <div class="max-w-7xl mx-auto space-y-8 p-4">Halaman Import Log</div>
    </template>

    <script>
        // --- DATA STATE (PERSISTENT FOR SESSION) ---
        let currentAppName = localStorage.getItem('app-name') || 'Pesantren Smart Digital';
        let currentUserRole = 'Editor';
        
        // Mock Logs Data
        let logs = [
            { 
                id: 1024, version: '2.4.1', date: '2023-11-24T10:30', 
                module: 'Student Portal', priority: 'tinggi', severity: 'Critical', 
                actual: 'Halaman hang selama 15 detik setelah klik submit formulir santri.', 
                expected: 'Pendaftaran diproses dalam waktu kurang dari 2 detik.', 
                status: 'todo', reporter: 'Ahmad F.', attachment: 'https://google.com' 
            },
            { 
                id: 1023, version: '2.4.0', date: '2023-11-23T14:15', 
                module: 'Payment Gateway', priority: 'sedang', severity: 'Major', 
                actual: 'Pilihan Virtual Account Bank BSI tidak muncul saat checkout.', 
                expected: 'Semua bank mitra muncul sesuai konfigurasi.', 
                status: 'done', reporter: 'Sarah M.', attachment: 'https://google.com' 
            },
            { 
                id: 1022, version: '2.4.0', date: '2023-11-20T09:00', 
                module: 'Admin Reports', priority: 'rendah', severity: 'Minor', 
                actual: 'Warna chart tidak konsisten dengan tema dark mode.', 
                expected: 'Chart menyesuaikan skema warna tema yang aktif.', 
                status: 'report', reporter: 'Ahmad F.', attachment: 'https://google.com' 
            }
        ];

        let comments = {
            1024: [
                { user: 'Ahmad F.', role: 'Reporter', text: 'Tolong prioritaskan ini karena menghambat pendaftaran santri baru.', time: '24 Nov, 10:35' },
                { user: 'Editor', role: 'Editor', text: 'Siap, tim sedang melakukan investigasi di bagian endpoint API.', time: '24 Nov, 11:20' }
            ]
        };

        // --- NAVIGATION & ROUTING ---
        const pages = {
            'dashboard': { title: 'Dashboard Overview', template: 'tpl-dashboard' },
            'all-logs': { title: 'All Logs Management', template: 'tpl-all-logs' },
            'reports': { title: 'Reports & Analytics', template: 'tpl-reports' },
            'settings': { title: 'Pengaturan Sistem', template: 'tpl-settings' },
            'team': { title: 'Team Access', template: 'tpl-team' },
            'add-log': { title: 'Tambah Log Baru', template: 'tpl-add-log' },
            'import-log': { title: 'Import Log', template: 'tpl-import-log' },
            'log-detail': { title: 'Log Detail & Forum', template: 'tpl-log-detail' },
            'edit-log': { title: 'Edit Log Entry', template: 'tpl-edit-log' }
        };

        function navigateTo(pageId, extraData = null) {
            const page = pages[pageId];
            if (!page) return;

            const container = document.getElementById('content-container');
            const template = document.getElementById(page.template);
            
            container.innerHTML = '';
            container.appendChild(template.content.cloneNode(true));
            document.getElementById('page-title').textContent = page.title;

            // Page Specific Inits
            if (pageId === 'dashboard') renderDashboard();
            if (pageId === 'all-logs') renderAllLogs();
            if (pageId === 'log-detail') renderLogDetail(extraData);
            if (pageId === 'edit-log') renderEditLog(extraData);
            if (pageId === 'settings') {
                const input = document.getElementById('app-name-input');
                if (input) input.value = currentAppName;
            }

            applyRoleUI();
            updateSidebarNav(pageId);
            applyAppNameUI();
            container.scrollTop = 0;
        }

        // --- UI RENDERERS ---

        function applyAppNameUI() {
            document.getElementById('sidebar-app-name').textContent = currentAppName;
            document.querySelectorAll('.app-name-display').forEach(el => el.textContent = currentAppName);
            document.title = currentAppName + " - Dashboard";
        }

        function saveAppName() {
            const val = document.getElementById('app-name-input').value;
            if (val) {
                currentAppName = val;
                localStorage.setItem('app-name', val);
                applyAppNameUI();
            }
        }

        function renderDashboard() {
            const body = document.getElementById('dashboard-table-body');
            body.innerHTML = '';
            
            // Stats
            document.querySelector('.total-count').textContent = logs.length;
            document.querySelector('.todo-count').textContent = logs.filter(l => l.status === 'todo').length;
            document.querySelector('.done-count').textContent = logs.filter(l => l.status === 'done').length;
            document.querySelector('.reject-count').textContent = logs.filter(l => l.status === 'reject').length;

            logs.forEach(log => {
                const tr = document.createElement('tr');
                tr.className = "hover:bg-gray-50/80 dark:hover:bg-white/5 transition-all cursor-pointer group";
                tr.onclick = (e) => {
                    if (e.target.closest('button')) return;
                    navigateTo('log-detail', log.id);
                };
                
                tr.innerHTML = `
                    <td class="px-4 py-4 text-center font-bold text-emerald-600">#${log.id}</td>
                    <td class="px-4 py-4">${log.version}</td>
                    <td class="px-4 py-4 whitespace-nowrap">${log.date.split('T')[0]}</td>
                    <td class="px-4 py-4 font-semibold text-gray-800 dark:text-white">${log.module}</td>
                    <td class="px-4 py-4"><span class="badge-prio-${log.priority} px-2.5 py-1 rounded-full text-[10px] font-bold uppercase">${log.priority}</span></td>
                    <td class="px-4 py-4"><span class="badge-status-${log.status} px-2.5 py-1 rounded-full text-[10px] font-bold uppercase">${log.status}</span></td>
                    <td class="px-4 py-4 text-xs">${log.reporter}</td>
                    <td class="px-4 py-4 text-right sticky right-0 bg-white dark:bg-[#1e1e1e] group-hover:bg-gray-50 dark:group-hover:bg-[#252525]">
                        <div class="flex justify-end gap-1">
                            <button onclick="navigateTo('log-detail', ${log.id})" class="p-1.5 text-blue-500 hover:bg-blue-50 rounded"><span class="material-symbols-outlined text-[18px]">visibility</span></button>
                            <button onclick="navigateTo('edit-log', ${log.id})" class="p-1.5 text-amber-500 hover:bg-amber-50 rounded role-editor-only"><span class="material-symbols-outlined text-[18px]">edit</span></button>
                        </div>
                    </td>
                `;
                body.appendChild(tr);
            });
        }

        function renderAllLogs() {
            const body = document.getElementById('all-logs-table-body');
            const searchVal = document.getElementById('log-search').value.toLowerCase();
            const filterVal = document.getElementById('filter-status').value;
            
            body.innerHTML = '';
            
            logs.filter(l => {
                const matchesSearch = l.module.toLowerCase().includes(searchVal) || l.reporter.toLowerCase().includes(searchVal) || l.id.toString().includes(searchVal);
                const matchesFilter = filterVal === 'all' || l.status === filterVal;
                return matchesSearch && matchesFilter;
            }).forEach(log => {
                const tr = document.createElement('tr');
                tr.className = "hover:bg-emerald-50/30 dark:hover:bg-emerald-900/5 transition-colors group cursor-pointer";
                tr.onclick = (e) => {
                    if (e.target.closest('button')) return;
                    navigateTo('log-detail', log.id);
                };

                tr.innerHTML = `
                    <td class="px-4 py-4 font-medium text-emerald-600">#${log.id}</td>
                    <td class="px-4 py-4">${log.version}</td>
                    <td class="px-4 py-4">${log.date.replace('T', ' ')}</td>
                    <td class="px-4 py-4 font-bold text-gray-900 dark:text-white">${log.module}</td>
                    <td class="px-4 py-4"><span class="badge-prio-${log.priority} px-2 py-0.5 rounded-full text-[11px] font-semibold capitalize">${log.priority}</span></td>
                    <td class="px-4 py-4"><span class="badge-status-${log.status} px-2 py-0.5 rounded-full text-[11px] font-semibold uppercase">${log.status}</span></td>
                    <td class="px-4 py-4 text-xs font-bold">${log.reporter}</td>
                    <td class="px-4 py-4 text-right sticky right-0 bg-white dark:bg-[#1e1e1e] group-hover:bg-emerald-50/10">
                        <div class="flex justify-end gap-1">
                            <button onclick="navigateTo('log-detail', ${log.id})" class="p-1.5 text-blue-500 hover:bg-blue-50 rounded-md"><span class="material-symbols-outlined text-[20px]">forum</span></button>
                            <button onclick="navigateTo('edit-log', ${log.id})" class="p-1.5 text-amber-500 hover:bg-amber-50 rounded-md role-editor-only"><span class="material-symbols-outlined text-[20px]">edit</span></button>
                        </div>
                    </td>
                `;
                body.appendChild(tr);
            });
        }

        function renderLogDetail(logId) {
            const log = logs.find(l => l.id == logId);
            if (!log) return navigateTo('dashboard');

            document.getElementById('detail-id').textContent = `#${log.id}`;
            document.getElementById('detail-module').textContent = log.module;
            document.getElementById('detail-version').textContent = log.version;
            document.getElementById('detail-date').textContent = log.date.replace('T', ' ');
            document.getElementById('detail-severity').textContent = log.severity;
            document.getElementById('detail-reporter').textContent = log.reporter;
            document.getElementById('detail-actual').textContent = log.actual;
            document.getElementById('detail-expected').textContent = log.expected;
            document.getElementById('detail-attachment').href = log.attachment;

            // Priority Class
            const prioEl = document.getElementById('detail-priority');
            prioEl.textContent = log.priority;
            prioEl.className = `px-3 py-1 rounded-full text-xs font-bold uppercase badge-prio-${log.priority}`;

            // Status Class
            const statEl = document.getElementById('detail-status');
            statEl.textContent = log.status;
            statEl.className = `px-3 py-1 rounded-full text-xs font-bold uppercase badge-status-${log.status}`;

            // Actions (Edit Button)
            const actions = document.getElementById('detail-actions');
            actions.innerHTML = `<button onclick="navigateTo('edit-log', ${log.id})" class="flex items-center gap-2 bg-amber-500 hover:bg-amber-600 text-white px-4 py-2 rounded-lg text-sm font-bold transition-all shadow-md"><span class="material-symbols-outlined text-sm">edit</span> Edit Log</button>`;

            renderComments(logId);
        }

        function renderComments(logId) {
            const bubbleContainer = document.getElementById('discussion-bubbles');
            bubbleContainer.innerHTML = '';
            
            const logComments = comments[logId] || [];
            logComments.forEach(c => {
                const isMe = c.user === 'Editor' && currentUserRole === 'Editor';
                const div = document.createElement('div');
                div.className = isMe ? "flex flex-col gap-1 items-end" : "flex flex-col gap-1 items-start";
                
                div.innerHTML = `
                    <div class="flex items-center gap-2 px-1">
                        <span class="text-[10px] font-black uppercase text-gray-400">${c.user}</span>
                        <span class="text-[10px] text-gray-300">${c.time}</span>
                    </div>
                    <div class="${isMe ? 'bubble-me' : 'bubble-other shadow-sm'}">
                        <p class="text-sm">${c.text}</p>
                    </div>
                `;
                bubbleContainer.appendChild(div);
            });
            bubbleContainer.scrollTop = bubbleContainer.scrollHeight;
        }

        function postComment() {
            const input = document.getElementById('comment-input');
            const logId = document.getElementById('detail-id').textContent.replace('#', '');
            
            if (input.value.trim() === '') return;

            if (!comments[logId]) comments[logId] = [];
            
            comments[logId].push({
                user: currentUserRole,
                role: currentUserRole,
                text: input.value,
                time: new Date().toLocaleTimeString('id-ID', { hour: '2-digit', minute: '2-digit' })
            });

            input.value = '';
            renderComments(logId);
        }

        function renderEditLog(logId) {
            const log = logs.find(l => l.id == logId);
            if (!log) return navigateTo('dashboard');

            document.getElementById('edit-header-title').textContent = `Edit Log #${log.id}`;
            document.getElementById('edit-log-id-internal').value = log.id;
            document.getElementById('edit-no-lap').value = log.id;
            document.getElementById('edit-versi').value = log.version;
            document.getElementById('edit-tanggal').value = log.date;
            document.getElementById('edit-modul').value = log.module;
            document.getElementById('edit-priority').value = log.priority;
            document.getElementById('edit-severity').value = log.severity;
            document.getElementById('edit-aktual').value = log.actual;
            document.getElementById('edit-harapan').value = log.expected;
            document.getElementById('edit-status').value = log.status;
            document.getElementById('edit-pelapor').value = log.reporter;
            document.getElementById('edit-lampiran').value = log.attachment;
        }

        function saveLogUpdate() {
            const logId = document.getElementById('edit-log-id-internal').value;
            const logIdx = logs.findIndex(l => l.id == logId);
            
            if (logIdx === -1) return;

            logs[logIdx] = {
                id: parseInt(document.getElementById('edit-no-lap').value),
                version: document.getElementById('edit-versi').value,
                date: document.getElementById('edit-tanggal').value,
                module: document.getElementById('edit-modul').value,
                priority: document.getElementById('edit-priority').value,
                severity: document.getElementById('edit-severity').value,
                actual: document.getElementById('edit-aktual').value,
                expected: document.getElementById('edit-harapan').value,
                status: document.getElementById('edit-status').value,
                reporter: document.getElementById('edit-pelapor').value,
                attachment: document.getElementById('edit-lampiran').value
            };

            // Success feedback
            const btn = document.querySelector('#edit-log-form button[type="submit"]');
            btn.textContent = "Berhasil Disimpan!";
            btn.className = "px-8 py-2.5 rounded-lg bg-blue-600 text-white text-sm font-bold shadow-lg shadow-blue-900/20";
            
            setTimeout(() => {
                navigateTo('log-detail', logId);
            }, 1000);
        }

        // --- CORE LOGIC ---

        function updateRole(role) {
            currentUserRole = role;
            const currentActivePage = document.querySelector('.nav-item.nav-active');
            const pageId = currentActivePage ? currentActivePage.id.replace('nav-', '') : 'dashboard';
            navigateTo(pageId);
        }

        function applyRoleUI() {
            const labels = document.querySelectorAll('.current-role-label');
            labels.forEach(el => el.textContent = currentUserRole);

            const editorElements = document.querySelectorAll('.role-editor-only');
            const viewerElements = document.querySelectorAll('.role-viewer-only');

            if (currentUserRole === 'Viewer') {
                editorElements.forEach(el => el.style.display = 'none');
                viewerElements.forEach(el => el.style.display = 'flex');
            } else {
                editorElements.forEach(el => el.style.display = 'flex');
                viewerElements.forEach(el => el.style.display = 'none');
            }
        }

        function toggleSidebar() {
            sidebar.classList.toggle('-translate-x-full');
        }

        function updateSidebarNav(pageId) {
            document.querySelectorAll('.nav-item').forEach(btn => {
                btn.classList.remove('nav-active');
                btn.classList.add('nav-inactive');
            });
            const activeNav = document.getElementById(`nav-${pageId}`);
            if (activeNav) {
                activeNav.classList.add('nav-active');
                activeNav.classList.remove('nav-inactive');
            }
        }

        window.onload = () => {
            navigateTo('dashboard');
            document.getElementById('roleSelector').value = currentUserRole;
        };
    </script>
</body>
</html>