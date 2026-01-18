# Project-Akhir-Sistem-Basis-Data
👥 Anggota Kelompok 👥
1. Muhammad Nur Hasan Majid
2. Adnan Muhammad Fihr
3. Aditya Firmansyah

🛠️ Tools yang Digunakan 🛠️
1. MySQL: Sebagai Sistem Manajemen Database (DBMS).
2. XAMPP: Sebagai server lokal untuk menjalankan layanan MySQL (MariaDB).
3. MySQL Workbench / phpMyAdmin: (Opsional) Untuk mempermudah eksekusi query dan visualisasi data.

📂--- Struktur Database ---📂
Proyek ini terdiri dari beberapa tabel utama:
1. barang: Menyimpan detail item, stok, dan harga.
2. jenisBarang: Kategorisasi barang (Alat Makan, Tempat Minum, Toples).
3. kasir: Data petugas kasir.
4. sales: Data petugas sales.
5. pelanggan: Data pelanggan.
6. vendor: Hubungan antara pemasok dan barang yang disediakan.
7. transaksi & detailBarang: Mencatat histori penjualan dan rincian item.

### Langkah Instalasi & Setup Database ###
1. install dan buka xampp jalankan (start) Apache dan MySQL
2. install dan buka MySQL setelah itu setup new connetion dan buat data base 

💻 Cara Menjalankan Program 💻
1. (Dasar): Cukup `SELECT` untuk memunculkan atau melihat isi didalam tabel
2. (Pencarian): Menggunakan `LIKE` untuk mencari barang di tabel
3. (Filter): Menggunakan `BETWEEN` untuk Menampilkan barang yang memiliki stok kritis antara 2 sampai 10 unit
4. 4 & 5 (Join): Kami pilih `Inner Join` (paling sering dipakai) dan `Left Join` (untuk melihat barang yang mungkin belum punya vendor).
