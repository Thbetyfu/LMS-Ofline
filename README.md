# 🎒 LMS Offline Portable (CourseLit)

**Learning Management System (LMS)** canggih yang bisa berjalan 100% dari **Flashdisk** tanpa perlu instalasi di komputer.

Project ini memodifikasi [CourseLit](https://courselit.app) agar bisa berjalan secara "Portable" dengan membawa runtime Node.js dan Database MongoDB sendiri di dalam folder, sehingga bisa dicolok dan dijalankan di komputer Windows mana saja (Sekolah, Lab, Laptop Guru) tanpa ribet.

---

## 🚀 Fitur Unggulan

1.  **Zero Installation**: Tidak perlu install Node.js atau MongoDB di komputer target. Cukup colok flashdisk & jalan.
2.  **100% Offline**: Berjalan di `localhost`. Sangat cepat dan tidak butuh kuota internet. Cocok untuk daerah 3T (Terdepan, Terluar, Tertinggal).
3.  **Data Sovereignty**: Database ada di tangan Anda (di flashdisk). Data nilai & siswa aman, tidak ada resiko bocor di cloud.
4.  **Desktop App Experience**: Menggunakan teknologi "Edge App Mode" untuk membuka LMS layaknya aplikasi desktop native (tanpa address bar browser).
5.  **Full Featured**: Bukan versi sunat. Ini adalah CourseLit versi production (Next.js) dengan fitur lengkap.

---

## 📂 Struktur Project

```text
/
├── courselit-portable/    # Source code LMS (Next.js)
├── node-portable/         # Runtime Node.js (Portable)
├── mongodb-portable/      # Database Engine (Portable)
├── mongodb-data/          # ⚠️ DATA PENYIMPANAN DATABASE (JANGAN DIHAPUS!)
├── START-COURSELIT.bat    # [Tombol 1] Untuk menyalakan Server
└── OPEN-APP.bat           # [Tombol 2] Untuk membuka Aplikasi
```

---

## 🛠️ Cara Penggunaan

### 1. Persiapan Awal (Hanya sekali)
1.  Clone repository ini ke Flashdisk.
2.  Jalankan `INSTALL_DEPENDENCIES.bat` (Butuh internet sebentar untuk download library awal).

### 2. Cara Menjalankan (Sehari-hari)
1.  Colok Flashdisk ke komputer.
2.  Klik ganda **`START-COURSELIT.bat`**.
    *   Akan muncul jendela hitam (Terminal).
    *   Tunggu sampai muncul tulisan: **`[SUCCESS] MongoDB Ready`** dan **`Ready in ...s`**.
    *   *Jangan tutup jendela ini selama aplikasi dipakai.*
3.  Klik ganda **`OPEN-APP.bat`**.
    *   Aplikasi LMS akan terbuka di layar.
    *   Login dan gunakan seperti biasa.

### 3. Cara Mematikan
1.  Tutup jendela Aplikasi.
2.  Buka jendela hitam (Terminal Server), tekan `Ctrl+C` lalu ketik `Y` (atau langsung close saja).
3.  **Eject** Flashdisk dengan aman (Safely Remove Hardware) agar database tidak rusak.

---

## 🔧 Troubleshooting

*   **Error "Port 3002 in use"**: Tutup semua jendela node.js/cmd yang terbuka, atau restart komputer. Script `START-COURSELIT.bat` sudah dilengkapi fitur *Auto-Kill* untuk mengatasi ini.
*   **Gambar tidak muncul**: Pastikan file gambar ada di folder `public`. Fitur Image Optimization dimatikan agar kompatibel dengan kondisi offline.
*   **Database Error / Corrupt**: Jika komputer mati mendadak saat flashdisk colok, file `mongodb-data/mongod.lock` mungkin perlu dihapus manual.

---

## ⚖️ Lisensi
Project ini dibangun di atas [CourseLit](https://github.com/codelitdev/courselit). Silakan rujuk lisensi asli CourseLit untuk penggunaan komersial.
Script portable launcher ini bebas digunakan (MIT).
