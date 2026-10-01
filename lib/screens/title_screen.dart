import 'package:flutter/material.dart';
import 'main_menu_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Gambar Latar Belakang (Background)
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/03_title_screen.png',
              fit: BoxFit.cover,
            ),
          ),

          // 2. Tombol Settings di pojok kanan atas
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F325E).withOpacity(0.85),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white, size: 26),
                    onPressed: () {
                      // Aksi pengaturan
                    },
                  ),
                ),
              ),
            ),
          ),

          // 3. Konten Tengah: Logo, Tagline, Tombol Mulai, & Sub-teks
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const SizedBox(height: 12),

                  // Tagline: "Code Your Adventure!"
                  const Text(
                    'Code Your Adventure!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          color: Color(0xFF0C2444),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Tombol "MULAI" bergaya Game
                  _buildStartButton(context),

                  const SizedBox(height: 14),

                  // Subtitle "Tap to Start Adventure"
                  const Text(
                    'Tap to Start Adventure',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          offset: Offset(0, 1.5),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 4. Label Versi di pojok kanan bawah
          const SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.0, right: 16.0),
                child: Text(
                  'v1.0.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Tombol "MULAI" 3D bergaya game
  Widget _buildStartButton(BuildContext context) {
    return Container(
      width: 240,
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFC77700), // Bayangan bawah tombol (efek 3D tebal)
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF0C3875),
          width: 3,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4), // Memberi celah layer 3D
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFDF6D),
              Color(0xFFFFAD26),
            ],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(13),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const MainMenuScreen(),
                ),
              );
            },
            child: const Center(
              child: Text(
                'MULAI',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                  color: Color(0xFF0A2B52),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}