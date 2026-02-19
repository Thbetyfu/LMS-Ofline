========================================
PANDUAN DESKTOP APP (TAURI vs EDGE)
========================================

STATUS:
1. Web App (Dependencies): SUKSES TERINSTALL (Siap Pakai).
2. Desktop App (Tauri): GAGAL (Syarat Belum Terpenuhi).

KENAPA TAURI GAGAL?
Untuk membuat aplikasi Tauri, komputer ini WAJIB menginstall:
1. Rust (Compiler bahasa pemrogaman Rust).
2. Visual Studio C++ Build Tools (Download sekitar 2-4 GB).

Karena kita ingin membuat versi "Portable" yang bisa jalan di mana saja tanpa install,
syarat ini terlalu berat dan tidak cocok untuk flashdisk (kecuali flashdisk 64GB+ dan disiapkan di PC developer lengkap).

SOLUSI ALTERNATIF (SUDAH SIAP):
Saya sudah membuatkan "Launcher Desktop Mode" menggunakan Microsoft Edge.
Ini akan membuka CourseLit seperti aplikasi native (tanpa address bar browser),
bersih, cepat, dan ringan (menggunakan engine Edge yang sudah ada di semua Windows).

CARA PAKAI (MODE DESKTOP):
1. Jalankan 'START-COURSELIT.bat'.
   (Tunggu sampai muncul tulisan "Ready in..." di layar hitam).
2. Jalankan 'OPEN-APP.bat'.
   (Aplikasi akan terbuka dalam jendela sendiri, mirip aplikasi asli).

JIKA TETAP INGIN TAURI (MANUAL):
Jika Anda punya kuota internet besar dan PC pribadi (bukan warnet/portable):
1. Install Rust: https://rustup.rs/
2. Install Build Tools: https://visualstudio.microsoft.com/visual-cpp-build-tools/
3. Baru jalankan perintah: npm run tauri build

Tapi untuk sekarang, 'OPEN-APP.bat' adalah solusi terbaik!
