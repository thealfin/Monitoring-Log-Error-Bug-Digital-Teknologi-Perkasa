<!DOCTYPE html>
<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Login - Pesantren Smart Digital Bug Tracking</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<style type="text/tailwindcss">
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            font-size: 24px;
        }
        :root {
            --primary-accent: #001D1A;
            --bg-light: #F9FAFB;
            --card-light: #FFFFFF;
        }
    </style>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#001D1A",
                        "light-bg": "#F9FAFB",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-[#F9FAFB] font-display text-gray-900 min-h-screen">
<div class="absolute top-6 right-6 z-50">
<button class="p-2.5 rounded-full bg-white shadow-sm border border-gray-200 text-gray-600 hover:bg-gray-50 transition-colors">
<span class="material-symbols-outlined">dark_mode</span>
</button>
</div>
<div class="flex min-h-screen">
<div class="hidden lg:flex lg:w-1/2 relative bg-gradient-to-br from-[#003d38] to-[#001D1A] overflow-hidden items-center justify-center">
<div class="absolute inset-0 overflow-hidden opacity-30 pointer-events-none">
<div class="absolute -top-[10%] -left-[10%] w-[50%] h-[50%] rounded-full bg-emerald-400 blur-[120px]"></div>
<div class="absolute -bottom-[10%] -right-[10%] w-[40%] h-[40%] rounded-full bg-emerald-600 blur-[100px]"></div>
</div>
<div class="relative z-10 px-12 text-center max-w-lg">
<div class="mb-10 flex justify-center">
<div class="bg-center bg-no-repeat aspect-square bg-cover rounded-2xl size-24 shadow-2xl border border-white/20" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuApMLl25c-NRgpYpUcO6Tsui_YcY4tJzjKCKGReK9lhoBM-0R1Fr-07VWayvtK_GRk7TKb1uW-ezRHrZE7C6x4Epg2WTsYLCqeKmCk-9hIvhm_c3kJ3KMPPQ_XkDaq54srSSDx7TvoVZmS9Ujq8JyAFEUAl5tIC1GJ1bvuXDBmMjvdUTr5ntBiKqtyZuO9N8wyrsfKNtEMEzKn_pi9mUOumfnBkcMFOEeMGw3K21u59nV8H6zMwGONrsPCDYyVuv8WUFN6X386ltXfw");'></div>
</div>
<h1 class="text-4xl font-extrabold text-white mb-6 leading-tight tracking-tight">Pesantren Smart Digital</h1>
<p class="text-xl text-emerald-50 font-light leading-relaxed">
                Manage and Track Your Systems Effectively
            </p>
<div class="mt-12 flex items-center justify-center gap-4 text-emerald-200/60">
<span class="material-symbols-outlined">security</span>
<span class="text-sm font-medium tracking-widest uppercase">High Performance Bug Tracking</span>
</div>
</div>
</div>
<div class="flex-1 flex flex-col justify-center items-center p-6 sm:p-12 md:p-20">
<div class="w-full max-w-[440px]">
<div class="lg:hidden flex flex-col items-center mb-8">
<div class="bg-center bg-no-repeat aspect-square bg-cover rounded-xl size-14 mb-4 border border-gray-100 shadow-md" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuApMLl25c-NRgpYpUcO6Tsui_YcY4tJzjKCKGReK9lhoBM-0R1Fr-07VWayvtK_GRk7TKb1uW-ezRHrZE7C6x4Epg2WTsYLCqeKmCk-9hIvhm_c3kJ3KMPPQ_XkDaq54srSSDx7TvoVZmS9Ujq8JyAFEUAl5tIC1GJ1bvuXDBmMjvdUTr5ntBiKqtyZuO9N8wyrsfKNtEMEzKn_pi9mUOumfnBkcMFOEeMGw3K21u59nV8H6zMwGONrsPCDYyVuv8WUFN6X386ltXfw");'></div>
<h2 class="text-2xl font-bold text-gray-900">Pesantren Smart</h2>
<p class="text-emerald-700 text-sm font-medium">Bug Tracker</p>
</div>
<div class="mb-10 text-center lg:text-left">
<h2 class="text-3xl font-extrabold text-gray-900 mb-2">Welcome Back</h2>
<p class="text-gray-600">Please enter your details to sign in.</p>
</div>
<div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100">
<form class="space-y-6">
<div>
<label class="block text-sm font-semibold text-gray-700 mb-2" for="email">Email Address</label>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-gray-400 text-lg">alternate_email</span>
</div>
<input class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 pl-11 text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-600 transition-all" id="email" placeholder="name@company.com" type="email"/>
</div>
</div>
<div>
<label class="block text-sm font-semibold text-gray-700 mb-2" for="password">Password</label>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-gray-400 text-lg">lock</span>
</div>
<input class="w-full bg-gray-50 border border-gray-200 rounded-xl px-4 py-3.5 pl-11 text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-emerald-500/20 focus:border-emerald-600 transition-all" id="password" placeholder="••••••••" type="password"/>
</div>
</div>
<div class="flex items-center justify-between py-1">
<div class="flex items-center">
<input class="h-4 w-4 rounded border-gray-300 bg-white text-emerald-600 focus:ring-emerald-500/20 focus:ring-offset-0" id="remember-me" name="remember-me" type="checkbox"/>
<label class="ml-2 block text-sm text-gray-600" for="remember-me">Remember me</label>
</div>
<a class="text-sm font-semibold text-emerald-700 hover:text-emerald-600 transition-colors" href="#">Forgot password?</a>
</div>
<button class="w-full bg-[#001D1A] hover:bg-[#003d38] text-white font-bold py-4 rounded-xl shadow-lg shadow-emerald-900/10 transition-all flex items-center justify-center gap-2 group" type="submit">
<span>Log In</span>
<span class="material-symbols-outlined text-lg group-hover:translate-x-1 transition-transform">arrow_forward</span>
</button>
</form>
</div>
<div class="mt-10 text-center">
<p class="text-sm text-gray-500">
                    © 2024 Pesantren Smart Digital. All rights reserved.
                </p>
</div>
</div>
</div>
</div>

</body></html>

halaman login yang salah email/password

<!DOCTYPE html>
<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Login - Pesantren Smart Digital Bug Tracking</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<style type="text/tailwindcss">
        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            font-size: 24px;
        }
        :root {
            --primary-accent: #001D1A;
            --bg-light: #F9FAFB;
            --card-light: #FFFFFF;
            --error-red: #EF4444;
            --error-bg: #FEF2F2;
        }
    </style>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#001D1A",
                        "light-bg": "#F9FAFB",
                        "error-border": "#EF4444",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    }
                },
            },
        }
    </script>
</head>
<body class="bg-[#F9FAFB] font-display text-gray-900 min-h-screen">
<div class="absolute top-6 right-6 z-50">
<button class="p-2.5 rounded-full bg-white shadow-sm border border-gray-200 text-gray-600 hover:bg-gray-50 transition-colors">
<span class="material-symbols-outlined">dark_mode</span>
</button>
</div>
<div class="flex min-h-screen">
<div class="hidden lg:flex lg:w-1/2 relative bg-gradient-to-br from-[#003d38] to-[#001D1A] overflow-hidden items-center justify-center">
<div class="absolute inset-0 overflow-hidden opacity-30 pointer-events-none">
<div class="absolute -top-[10%] -left-[10%] w-[50%] h-[50%] rounded-full bg-emerald-400 blur-[120px]"></div>
<div class="absolute -bottom-[10%] -right-[10%] w-[40%] h-[40%] rounded-full bg-emerald-600 blur-[100px]"></div>
</div>
<div class="relative z-10 px-12 text-center max-w-lg">
<div class="mb-10 flex justify-center">
<div class="bg-center bg-no-repeat aspect-square bg-cover rounded-2xl size-24 shadow-2xl border border-white/20" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuApMLl25c-NRgpYpUcO6Tsui_YcY4tJzjKCKGReK9lhoBM-0R1Fr-07VWayvtK_GRk7TKb1uW-ezRHrZE7C6x4Epg2WTsYLCqeKmCk-9hIvhm_c3kJ3KMPPQ_XkDaq54srSSDx7TvoVZmS9Ujq8JyAFEUAl5tIC1GJ1bvuXDBmMjvdUTr5ntBiKqtyZuO9N8wyrsfKNtEMEzKn_pi9mUOumfnBkcMFOEeMGw3K21u59nV8H6zMwGONrsPCDYyVuv8WUFN6X386ltXfw");'></div>
</div>
<h1 class="text-4xl font-extrabold text-white mb-6 leading-tight tracking-tight">Pesantren Smart Digital</h1>
<p class="text-xl text-emerald-50 font-light leading-relaxed">
                Manage and Track Your Systems Effectively
            </p>
<div class="mt-12 flex items-center justify-center gap-4 text-emerald-200/60">
<span class="material-symbols-outlined">security</span>
<span class="text-sm font-medium tracking-widest uppercase">High Performance Bug Tracking</span>
</div>
</div>
</div>
<div class="flex-1 flex flex-col justify-center items-center p-6 sm:p-12 md:p-20">
<div class="w-full max-w-[440px]">
<div class="lg:hidden flex flex-col items-center mb-8">
<div class="bg-center bg-no-repeat aspect-square bg-cover rounded-xl size-14 mb-4 border border-gray-100 shadow-md" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuApMLl25c-NRgpYpUcO6Tsui_YcY4tJzjKCKGReK9lhoBM-0R1Fr-07VWayvtK_GRk7TKb1uW-ezRHrZE7C6x4Epg2WTsYLCqeKmCk-9hIvhm_c3kJ3KMPPQ_XkDaq54srSSDx7TvoVZmS9Ujq8JyAFEUAl5tIC1GJ1bvuXDBmMjvdUTr5ntBiKqtyZuO9N8wyrsfKNtEMEzKn_pi9mUOumfnBkcMFOEeMGw3K21u59nV8H6zMwGONrsPCDYyVuv8WUFN6X386ltXfw");'></div>
<h2 class="text-2xl font-bold text-gray-900">Pesantren Smart</h2>
<p class="text-emerald-700 text-sm font-medium">Bug Tracker</p>
</div>
<div class="mb-10 text-center lg:text-left">
<h2 class="text-3xl font-extrabold text-gray-900 mb-2">Welcome Back</h2>
<p class="text-gray-600">Please enter your details to sign in.</p>
</div>
<div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100">
<div class="mb-6 p-4 rounded-xl bg-[var(--error-bg)] border border-red-100 flex items-start gap-3">
<span class="material-symbols-outlined text-[#EF4444] text-xl mt-0.5">error</span>
<p class="text-sm font-medium text-[#EF4444] leading-snug">
                        Email atau kata sandi yang Anda masukkan salah. Silakan coba lagi.
                    </p>
</div>
<form class="space-y-6">
<div>
<label class="block text-sm font-semibold text-gray-700 mb-2" for="email">Email Address</label>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-gray-400 text-lg">alternate_email</span>
</div>
<input class="w-full bg-gray-50 border border-[#EF4444] rounded-xl px-4 py-3.5 pl-11 text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-red-500/10 focus:border-[#EF4444] transition-all" id="email" placeholder="name@company.com" type="email" value="user@example.com"/>
</div>
<p class="mt-2 text-xs font-medium text-[#EF4444]">Email atau kata sandi yang Anda masukkan salah.</p>
</div>
<div>
<label class="block text-sm font-semibold text-gray-700 mb-2" for="password">Password</label>
<div class="relative">
<div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
<span class="material-symbols-outlined text-gray-400 text-lg">lock</span>
</div>
<input class="w-full bg-gray-50 border border-[#EF4444] rounded-xl px-4 py-3.5 pl-11 text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-red-500/10 focus:border-[#EF4444] transition-all" id="password" placeholder="••••••••" type="password" value="wrongpassword"/>
</div>
<p class="mt-2 text-xs font-medium text-[#EF4444]">Silakan coba lagi.</p>
</div>
<div class="flex items-center justify-between py-1">
<div class="flex items-center">
<input class="h-4 w-4 rounded border-gray-300 bg-white text-emerald-600 focus:ring-emerald-500/20 focus:ring-offset-0" id="remember-me" name="remember-me" type="checkbox"/>
<label class="ml-2 block text-sm text-gray-600" for="remember-me">Remember me</label>
</div>
<a class="text-sm font-semibold text-emerald-700 hover:text-emerald-600 transition-colors" href="#">Forgot password?</a>
</div>
<button class="w-full bg-[#001D1A] hover:bg-[#003d38] text-white font-bold py-4 rounded-xl shadow-lg shadow-emerald-900/10 transition-all flex items-center justify-center gap-2 group" type="submit">
<span>Log In</span>
<span class="material-symbols-outlined text-lg group-hover:translate-x-1 transition-transform">arrow_forward</span>
</button>
</form>
</div>
<div class="mt-10 text-center">
<p class="text-sm text-gray-500">
                    © 2024 Pesantren Smart Digital. All rights reserved.
                </p>
</div>
</div>
</div>
</div>

</body></html>