POP UP LIGHT
<!DOCTYPE html>
<html lang="id"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Success Animation Modal - Pesantren Smart Digital</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#10b981", // Emerald Green
                        "background-light": "#f8fafc",
                        "dark-text": "#1a1a1a",
                        "grey-text": "#4b5563",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.5rem",
                        "lg": "1rem",
                        "xl": "1.5rem",
                        "2xl": "2rem",
                        "full": "9999px"
                    },
                    boxShadow: {
                        'soft': '0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)',
                    }
                },
            },
        }
    </script>
<style type="text/tailwindcss">
        .backdrop-blur-light {
            backdrop-filter: blur(12px);
        }
    </style>
</head>
<body class="bg-background-light font-display min-h-screen">
<div class="relative flex h-screen w-full flex-col overflow-hidden">
<header class="flex items-center justify-between border-b border-gray-200 px-10 py-4 opacity-40 pointer-events-none">
<div class="flex items-center gap-4">
<div class="size-8 text-primary">
<span class="material-symbols-outlined text-3xl">school</span>
</div>
<h2 class="text-dark-text text-lg font-bold">Pesantren Smart Digital</h2>
</div>
<div class="flex flex-1 justify-end">
<div class="bg-gray-200 rounded-full size-10 border-2 border-gray-100"></div>
</div>
</header>
<main class="flex-1 p-10 opacity-30 pointer-events-none">
<div class="max-w-4xl mx-auto space-y-8">
<div class="h-8 w-64 bg-gray-200 rounded"></div>
<div class="grid grid-cols-3 gap-6">
<div class="h-40 bg-gray-100 rounded-2xl"></div>
<div class="h-40 bg-gray-100 rounded-2xl"></div>
<div class="h-40 bg-gray-100 rounded-2xl"></div>
</div>
<div class="h-80 bg-gray-100 rounded-2xl"></div>
</div>
</main>
<div class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-white/60 backdrop-blur-light">
<div class="relative w-full max-w-md bg-[#FFFFFF] rounded-2xl shadow-soft border border-gray-100 p-10 flex flex-col items-center text-center">
<button class="absolute top-6 right-6 text-gray-400 hover:text-dark-text transition-colors">
<span class="material-symbols-outlined">close</span>
</button>
<div class="mb-8">
<div class="w-24 h-24 rounded-full border-4 border-primary/20 flex items-center justify-center bg-primary/10">
<span class="material-symbols-outlined text-6xl text-primary font-bold">check</span>
</div>
</div>
<div class="space-y-3 mb-10">
<h1 class="text-dark-text text-3xl font-bold tracking-tight">Berhasil!</h1>
<p class="text-grey-text text-base leading-relaxed px-2">
                        Aksi Anda telah berhasil diproses oleh sistem Pesantren Smart Digital secara aman.
                    </p>
</div>
<div class="w-full flex flex-col gap-4">
<button class="w-full py-4 bg-primary hover:bg-emerald-600 text-white font-semibold text-base rounded-xl transition-all active:scale-[0.98] shadow-md shadow-primary/20">
                        Lanjutkan
                    </button>
<button class="w-full py-2 bg-transparent text-gray-500 hover:text-dark-text text-sm font-medium transition-colors">
                        Tutup
                    </button>
</div>
</div>
</div>
</div>
<div class="fixed top-0 left-0 w-full h-full -z-10 pointer-events-none overflow-hidden opacity-50">
<div class="absolute top-[-15%] right-[-10%] w-[500px] h-[500px] bg-primary/5 blur-[100px] rounded-full"></div>
<div class="absolute bottom-[-15%] left-[-10%] w-[500px] h-[500px] bg-emerald-500/5 blur-[100px] rounded-full"></div>
</div>

</body></html>

POP UP DARK
<!DOCTYPE html>

<html class="dark" lang="id"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Success Animation Modal - Pesantren Smart Digital</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#13ec92",
                        "background-light": "#f6f8f7",
                        "background-dark": "#10221a",
                        "modal-dark": "#1E1E1E",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.5rem",
                        "lg": "1rem",
                        "xl": "1.5rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
        .backdrop-blur-custom {
            backdrop-filter: blur(24px);
        }
        .success-glow {
            box-shadow: 0 0 40px -10px rgba(19, 236, 146, 0.2);
        }
        /* Simulated Drawing Animation via CSS if JS is not allowed, using standard transitions */
        .check-container {
            position: relative;
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body class="bg-background-light dark:bg-background-dark font-display min-h-screen">
<!-- Main Background Content (Blurred) -->
<div class="relative flex h-screen w-full flex-col overflow-hidden">
<!-- Top Navigation Bar Component -->
<header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#234839] px-10 py-3 opacity-30 pointer-events-none">
<div class="flex items-center gap-4 text-white">
<div class="size-6 text-primary">
<span class="material-symbols-outlined text-3xl">school</span>
</div>
<h2 class="text-white text-lg font-bold leading-tight tracking-[-0.015em]">Pesantren Smart Digital</h2>
</div>
<div class="flex flex-1 justify-end gap-8">
<div class="bg-center bg-no-repeat aspect-square bg-cover rounded-full size-10 border-2 border-primary/30" data-alt="User profile avatar portrait" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBUDcN0faPBmlRE3ZVdw_BsYrUHgbSbSOxu3NsF9YJnZ7s2VpKrCgI9MkdDR_aoqVDx0MLHAV7kybBvk5GzTTSDBlbkF1LfEH3rYc_IxBvaqmELf2ex3-2imcj5lM-Gg6nSd54rvGZN8nQxE5C3dq04gnGTwuhQF43b-3k2IIh1OENcLyE83yl2UkXXMabirpLPnKE9NG9XWd-CqdOgEmr7QdyW-f-NthCY9mHrxxbw-6b3KUdg0f0XjDy6wavXGTO_Bjv0zvvLVrAM");'></div>
</div>
</header>
<main class="flex-1 p-10 opacity-20 pointer-events-none">
<div class="max-w-4xl mx-auto space-y-6">
<div class="h-8 w-48 bg-gray-700 rounded"></div>
<div class="grid grid-cols-3 gap-6">
<div class="h-32 bg-gray-800 rounded-xl"></div>
<div class="h-32 bg-gray-800 rounded-xl"></div>
<div class="h-32 bg-gray-800 rounded-xl"></div>
</div>
<div class="h-64 bg-gray-800 rounded-xl"></div>
</div>
</main>
<!-- Success Modal Overlay -->
<div class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-background-dark/80 backdrop-blur-custom">
<!-- Modal Card Component -->
<div class="relative w-full max-w-md bg-modal-dark rounded-xl success-glow border border-white/5 p-8 flex flex-col items-center text-center transform scale-100 transition-transform duration-300">
<!-- Close Button -->
<button class="absolute top-4 right-4 text-gray-500 hover:text-white transition-colors">
<span class="material-symbols-outlined">close</span>
</button>
<!-- Animated Success Icon Area -->
<div class="mb-6 relative">
<div class="w-20 h-20 rounded-full border-4 border-primary flex items-center justify-center bg-primary/10">
<span class="material-symbols-outlined text-5xl text-primary font-bold">check</span>
</div>
<!-- Subtle ripple effect circles -->
<div class="absolute inset-0 rounded-full border-2 border-primary/30 animate-ping"></div>
</div>
<!-- Text Content -->
<div class="space-y-2 mb-8">
<h1 class="text-white text-3xl font-bold tracking-tight">Berhasil!</h1>
<p class="text-gray-400 text-base leading-relaxed px-4">
                        Aksi Anda telah berhasil diproses oleh sistem Pesantren Smart Digital secara aman.
                    </p>
</div>
<!-- Action Button -->
<div class="w-full flex flex-col gap-3">
<button class="w-full py-4 bg-primary hover:bg-primary/90 text-background-dark font-bold text-base rounded-xl transition-all active:scale-[0.98] flex items-center justify-center gap-2">
<span>Lanjutkan</span>
<span class="material-symbols-outlined text-xl">arrow_forward</span>
</button>
<!-- Single Button Variant for "Tutup" -->
<button class="w-full py-3 bg-transparent hover:bg-white/5 text-gray-400 hover:text-white text-sm font-medium rounded-xl transition-colors">
                        Tutup
                    </button>
</div>
</div>
</div>
</div>
<!-- Background Decoration -->
<div class="fixed top-0 left-0 w-full h-full -z-10 pointer-events-none overflow-hidden">
<div class="absolute top-[-10%] right-[-10%] w-96 h-96 bg-primary/10 blur-[120px] rounded-full"></div>
<div class="absolute bottom-[-10%] left-[-10%] w-96 h-96 bg-primary/5 blur-[120px] rounded-full"></div>
</div>
</body></html>