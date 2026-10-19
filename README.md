# algoplay_ai

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

AlgoPlay AI
AlgoPlay AI adalah prototipe aplikasi pembelajaran algoritma dan pemrograman untuk pemula yang dirancang dengan pendekatan permainan interaktif (gamification) dan konsep AI Tutor sebagai pendamping belajar.
Status: prototipe dalam pengembangan. Fitur yang dijelaskan dalam proposal belum tentu semuanya selesai atau telah diuji. Perbarui status berdasarkan kode dan pengujian aktual.

Tujuan
Membantu pemula mempelajari algoritma dan pemrograman melalui materi bertahap, latihan interaktif, dan elemen gamifikasi.
Fitur yang direncanakan
- Materi dasar algoritma dan pemrograman.
- Quiz, Code Puzzle, Bug Hunter, dan Predict Output.
- Gamifikasi: XP, level, badge, streak, dan progres.
- AI Tutor untuk memberikan penjelasan atau petunjuk.
- Antarmuka permainan, termasuk title screen, menu utama, dan pemilihan karakter.
Catatan: daftar ini merupakan rancangan fitur. Jangan menganggap fitur telah tersedia sebelum diperiksa dan diuji.
Teknologi
- Flutter dan Dart
- Visual Studio Code
- Git dan GitHub
- shared_preferences telah ditambahkan sebagai dependensi untuk preferensi lokal; fungsi penyimpanan pilihan karakter masih perlu diverifikasi melalui pengujian.
- Chrome/Microsoft Edge untuk pengujian Flutter Web
Integrasi API AI, database, dan fitur lain hanya dianggap tersedia jika benar-benar sudah diterapkan di kode.
Struktur proyek
Contoh struktur umum Flutter (sesuaikan dengan folder aktual repositori):

algoplay_ai/
├── android/
├── web/
├── test/
│
├── assets/
│   ├── images/
│   │   ├── backgrounds/
|   |   |__ badges/
│   │   ├── characters/
│   │   ├── npc/
│   │   ├── maps/
|   |   |__ reference/
│   │   └── ui/
|   |       |__ buttons/
|   |       |__ icons/
|   |       |__ panels/    
│   ├── audio/
│   │   ├── bgm/
│   │   └── sfx/
│   ├── fonts/
│   └── animations/
│
├── lib/
│   ├── main.dart
│   │
│   ├── app/
│   │   ├── app.dart
│   │   ├── routes.dart
│   │   └── theme.dart
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_colors.dart
│   │   │   ├── app_strings.dart
│   │   │   └── app_constants.dart
│   │   ├── utils/
│   │   │   ├── validators.dart
│   │   │   └── formatters.dart
│   │   └── errors/
│   │       └── app_exceptions.dart
│   │
│   ├── screens/
│   │   ├── splash/
│   │   │   └── splash_screen.dart
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── title/
│   │   │   └── title_screen.dart
│   │   ├── main_menu/
│   │   │   └── main_menu_screen.dart
│   │   ├── character/
│   │   │   └── character_screen.dart
│   │   ├── dashboard/
│   │   │   └── dashboard_screen.dart
│   │   ├── world_map/
│   │   │   └── world_map_screen.dart
│   │   ├── mission/
│   │   │   └── mission_screen.dart
│   │   ├── lesson/
│   │   │   └── lesson_screen.dart
│   │   ├── challenge/
│   │   │   ├── challenge_screen.dart
│   │   │   ├── code_puzzle_screen.dart
│   │   │   ├── bug_hunter_screen.dart
│   │   │   ├── predict_output_screen.dart
│   │   │   └── algorithm_challenge_screen.dart
│   │   ├── result/
│   │   │   └── result_screen.dart
│   │   ├── progress/
│   │   │   └── progress_screen.dart
│   │   ├── achievement/
│   │   │   └── achievement_screen.dart
│   │   ├── profile/
│   │   │   └── profile_screen.dart
│   │   └── ai_tutor/
│   │       └── ai_tutor_screen.dart
│   │
│   ├── game/
│   │   ├── algo_play_game.dart
│   │   ├── components/
│   │   │   ├── player_component.dart
│   │   │   ├── npc_component.dart
│   │   │   ├── obstacle_component.dart
│   │   │   └── world_component.dart
│   │   ├── maps/
│   │   │   └── beginner_forest_map.dart
│   │   └── systems/
│   │       ├── collision_system.dart
│   │       └── interaction_system.dart
│   │
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── lesson_model.dart
│   │   ├── mission_model.dart
│   │   ├── challenge_model.dart
│   │   ├── question_model.dart
│   │   ├── progress_model.dart
│   │   ├── achievement_model.dart
│   │   └── ai_message_model.dart
│   │
│   ├── services/
│   │   ├── auth_service.dart
│   │   ├── storage_service.dart
│   │   ├── lesson_service.dart
│   │   ├── challenge_service.dart
│   │   ├── progress_service.dart
│   │   ├── achievement_service.dart
│   │   └── ai_tutor_service.dart
│   │
│   ├── data/
│   │   ├── local/
│   │   │   └── local_storage.dart
│   │   └── repositories/
│   │       ├── lesson_repository.dart
│   │       ├── challenge_repository.dart
│   │       └── progress_repository.dart
│   │
│   ├── widgets/
│   │   ├── app_button.dart
│   │   ├── app_card.dart
│   │   ├── loading_widget.dart
│   │   ├── progress_bar.dart
│   │   ├── xp_badge.dart
│   │   └── character_avatar.dart
│   │
│   └── features/
│       ├── gamification/
│       │   ├── xp_manager.dart
│       │   ├── level_manager.dart
│       │   └── streak_manager.dart
│       └── learning/
│           ├── learning_path.dart
│           └── lesson_catalog.dart
│
├── pubspec.yaml
├── pubspec.lock
├── analysis_options.yaml
├── README.md
├── AI_DECLARATION.md
└── .gitignore

## struktur file yang sedang berjalan
C:\ALGOPLAY_AI\LIB
│   main.dart
│   
├───screens
│       achievement_screen.dart
│       ai_tutor_screen.dart
│       character_screen.dart
│       login_screen.dart
│       main_menu_screen.dart
│       map_screen.dart
│       register_screen.dart
│       splash_screen.dart
│       title_screen.dart
│       
└───widgets
        interactive_game_character.dart
        social_auth_options.dart

Persiapan
Pasang Flutter SDK, Git, dan editor kode. Jalankan:
flutter --version
flutter doctor
Menjalankan aplikasi
1. Kloning repositori:
   git clone https://github.com/yasir180626/algoplay_ai.git
   cd algoplay_ai
2. Unduh dependensi:
   flutter pub get
3. Periksa perangkat yang tersedia:
   flutter devices
4. Jalankan di Chrome jika Chrome terdeteksi:
   flutter run -d chrome
Untuk menjalankan di Android, Android SDK dan emulator/perangkat harus sudah terpasang serta terdeteksi oleh Flutter.
Pengujian
Catat skenario, hasil aktual, dan status pengujian sebelum menyatakan fitur berhasil. Pengujian Android tidak boleh dinyatakan berhasil jika belum dijalankan pada emulator/perangkat Android.
Area	Status yang perlu diverifikasi
Title screen, menu utama, pemilihan karakter	Uji pada versi kode terbaru
Penyimpanan karakter dengan shared_preferences	Dependensi ditambahkan; perilaku belum dinyatakan terverifikasi
Flutter Web	Isi berdasarkan hasil uji aktual
Android	Isi setelah emulator/perangkat terdeteksi dan diuji
Modul pembelajaran, gamifikasi, AI Tutor	Sesuaikan dengan implementasi aktual


Penggunaan AI
ChatGPT dapat digunakan sebagai alat bantu memahami kode, membahas solusi, menelaah pesan kesalahan, dan menyusun dokumentasi. Semua saran harus diperiksa dan diuji oleh pengembang. Rincian penggunaan AI ada di [AI_DECLARATION.md]
Pengembang
- Nama: Muhamad Yasir
- NPM: 2413025006
- Kelas: PTI 2024B
- Program Studi: Pendidikan Teknologi Informasi, Universitas Lampung
Repositori
https://github.com/yasir180626/algoplay_ai.git