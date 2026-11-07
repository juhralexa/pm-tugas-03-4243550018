# KALKULATOR IP SEMESTER

Program Kalkulator IP Semester berbasis Dart Console untuk menghitung Indeks Prestasi (IP) mahasiswa berdasarkan mata kuliah, jumlah SKS, dan nilai huruf.

## Identitas Mahasiswa

- **Nama:** Juhraini Helfiana Lexa
- **NIM:** 4243550018
- **Program Studi:** Ilmu Komputer
- **Mata Kuliah:** Pemrograman Mobile
- **Tugas:** Tugas Rutin 3

## Fitur Program

1. Memasukkan data mata kuliah secara berulang.
2. Menghentikan input dengan mengosongkan nama mata kuliah.
3. Mengonversi nilai huruf A, B, C, D, dan E menjadi bobot angka.
4. Memvalidasi jumlah SKS dan nilai huruf.
5. Menghitung IP Semester menggunakan `fold`.
6. Menampilkan mata kuliah dengan bobot nilai di bawah 2 menggunakan `where`.
7. Mengurutkan KHS berdasarkan nilai tertinggi menggunakan `sort`.
8. Menampilkan total SKS, IP Semester, dan predikat kelulusan.

## Cara Menjalankan Program

Pastikan Dart SDK sudah terpasang.

Jalankan perintah berikut melalui terminal pada folder proyek:

```bash
dart pub get
dart run
```

Untuk memeriksa kode program:

```bash
dart analyze
```

## Penjelasan Higher-Order Function dan Error Handling

Program ini menggunakan higher-order function untuk mengolah data mata kuliah secara lebih sederhana. Pada fungsi `hitungIp()`, metode `fold` digunakan untuk menjumlahkan seluruh SKS dan menghitung total bobot nilai berdasarkan perkalian SKS dengan bobot huruf. Selanjutnya, metode `where` pada fungsi `cetakKhs()` digunakan untuk mencari mata kuliah yang memiliki bobot nilai di bawah 2.0. Pengurutan data KHS dilakukan menggunakan `sort` dengan comparator agar mata kuliah dengan nilai tertinggi ditampilkan terlebih dahulu.

Untuk error handling, program menggunakan `FormatException` pada fungsi `validasiSks()` dan `bobot()`. Kesalahan tersebut ditangkap menggunakan `try-catch` di dalam fungsi `main()`. Dengan demikian, ketika pengguna memasukkan SKS yang tidak valid atau nilai huruf selain A sampai E, program menampilkan pesan kesalahan dan tidak menyimpan data tersebut. Program tetap berjalan sehingga pengguna dapat memasukkan data mata kuliah lainnya.

## Screenshot Pengujian

Dokumentasi hasil pengujian program tersedia pada folder `screenshots/`:

- `hasil-program.png`
- `validasi-sks.png`
- `validasi-nilai.png`

## Pernyataan Penggunaan AI

Saya menggunakan ChatGPT sebagai alat bantu untuk memahami instruksi tugas, mempelajari konsep pemrograman Dart, serta membantu memeriksa kode program. Saya tetap menjalankan dan menguji program untuk memastikan hasilnya sesuai dengan ketentuan tugas.

