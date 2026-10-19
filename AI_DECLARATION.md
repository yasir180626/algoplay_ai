# AI Declaration — AlgoPlay AI

Dokumen ini menjelaskan penggunaan AI sebagai alat bantu dalam pengembangan dan dokumentasi AlgoPlay AI. Pengembang tetap bertanggung jawab untuk memahami, memeriksa, menguji, dan memperbaiki kode.

## 1. Alat AI
- ChatGPT (OpenAI): digunakan untuk bantuan diskusi teknis, memahami dan menelaah kode Flutter/Dart, membahas pesan kesalahan, serta menyusun dokumentasi.

Periksa bagian ini dan sesuaikan jika alat lain digunakan atau jika ada alat yang tidak digunakan.

## 2. Bentuk bantuan AI
Bantuan yang dibahas selama pengembangan meliputi:
- Membahas struktur dan perilaku widget Flutter.
- Memberi saran untuk alur pemilihan karakter.
- Menjelaskan penggunaan `shared_preferences` untuk preferensi lokal.
- Membantu menelaah keluaran alat pengembangan.
- Membantu menyusun README dan deklarasi AI.

Pertahankan hanya keterangan yang sesuai dengan aktivitas yang benar-benar dilakukan.

## 3. Contoh prompt
Prompt berikut adalah contoh dan bukan klaim kutipan persis dari riwayat percakapan. Ganti dengan prompt asli bila redaksinya berbeda.

1 Pemilihan karakter
> Bantu perbaiki kode Flutter pada halaman pemilihan karakter agar karakter yang dipilih dapat ditandai dan pilihan tersebut dapat ditampilkan kembali ketika pengguna membuka halaman menu utama.

2 Penyimpanan lokal
> Jelaskan cara menggunakan `shared_preferences` pada Flutter untuk menyimpan pilihan karakter, memuat kembali nilai tersebut saat halaman dibuka, dan memperbarui tampilan berdasarkan karakter yang tersimpan.

3 Analisis pesan kesalahan
> Bantu analisis pesan kesalahan atau hasil `flutter analyze` berikut. Jelaskan penyebabnya, apakah termasuk error atau peringatan, dan langkah perbaikan yang perlu diuji.

## 4. Bagian yang dibantu AI dan pemeriksaan pengembang

Dalam proses pengembangan aplikasi AlgoPlay AI, AI digunakan sebagai alat bantu untuk memahami konsep, mencari alternatif solusi, menganalisis permasalahan, dan menyusun dokumentasi. Penggunaan AI dilakukan dengan tetap menempatkan pengembang sebagai pihak yang bertanggung jawab atas implementasi dan pengujian aplikasi.

Pada pengembangan menggunakan Flutter dan Dart, AI membantu menjelaskan konsep pemrograman serta memberikan alternatif solusi terhadap permasalahan yang ditemukan. Pengembang bertanggung jawab untuk memahami kode yang digunakan dan memastikan bahwa solusi tersebut sesuai dengan kebutuhan proyek.

Dalam pengembangan fitur pemilihan karakter, AI memberikan saran mengenai alur penggunaan widget dan pengelolaan status pilihan karakter. Pengembang bertanggung jawab untuk menguji perilaku fitur secara langsung pada aplikasi agar dapat dipastikan berjalan sesuai dengan yang diharapkan.

Pada penggunaan shared_preferences, AI membantu menjelaskan pola penyimpanan dan pemuatan data lokal. Sementara itu, pengembang bertanggung jawab untuk memastikan implementasi kode berjalan dengan benar serta memverifikasi bahwa data yang disimpan dapat dimuat kembali sesuai kebutuhan.

Dalam proses analisis masalah, AI membantu menjelaskan pesan kesalahan atau keluaran dari alat pengembangan. Pengembang tetap bertanggung jawab untuk menjalankan kembali perintah, memeriksa hasilnya, dan memastikan bahwa permasalahan telah ditangani dengan benar.

Pengembang bertanggung jawab untuk meninjau dan memperbaiki dokumentasi tersebut agar seluruh informasi yang dicantumkan sesuai dengan kondisi repositori dan implementasi aplikasi yang sebenarnya.

AI berperan sebagai alat bantu selama proses pengembangan, sedangkan keputusan teknis, penerapan kode, pengujian, dan verifikasi akhir tetap menjadi tanggung jawab pengembang.

## 5. Pemeriksaan dan penyesuaian manual
Sebelum menerima saran AI, pengembang perlu:
1. Membaca dan memahami kode yang disarankan.
2. Memeriksa kecocokannya dengan struktur proyek dan dependensi.
3. Menjalankan aplikasi pada platform yang tersedia.
4. Menguji fitur dengan skenario yang relevan.
5. Memeriksa keluaran `flutter analyze` dan membedakan error dari informasi/peringatan.
6. Memperbaiki atau menolak saran yang tidak sesuai.
7. Mencatat perubahan menggunakan commit Git yang jelas.

Catatan pengembangan sebelumnya menunjukkan pesan deprecation terkait `withOpacity`. Status akhir harus didasarkan pada pemeriksaan terbaru; pesan tersebut tidak otomatis berarti aplikasi gagal dijalankan.

## 6. Keterbatasan dan risiko
- Saran AI mungkin tidak cocok dengan versi Flutter, dependensi, atau struktur proyek.
- Kode yang tampak benar belum tentu berfungsi sebelum dijalankan dan diuji.
- AI dapat mengasumsikan fitur sudah ada padahal belum diimplementasikan.
- Jangan masukkan kata sandi, token API, atau kredensial ke prompt.
- Pengembang bertanggung jawab atas kualitas, keamanan, dan pemahaman kode akhir.

## 7. Pernyataan integritas akademik
Saya menyatakan bahwa AI digunakan sebagai alat bantu selama proses pengembangan dan dokumentasi AlgoPlay AI. Saran AI tidak otomatis dianggap sebagai hasil akhir; perubahan harus diperiksa dan diuji. Saya bertanggung jawab untuk memahami kode yang dikumpulkan, memastikan dokumentasi sesuai kondisi proyek sebenarnya, serta menjelaskan bagian yang dibantu AI dan penyesuaian yang dilakukan.

Nama: Muhamad Yasir  
NPM: 2413025006  
Kelas: PTI 2024B
