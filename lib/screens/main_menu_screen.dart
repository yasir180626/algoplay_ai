import 'package:flutter/material.dart';

import 'character_screen.dart';
import 'map_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // =====================================================
          // BACKGROUND
          // =====================================================
          Image.asset('assets/backgrounds/05_main_menu.png', fit: BoxFit.cover),

          // Sedikit overlay agar UI lebih mudah dibaca
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.20),
                  Colors.transparent,
                  Colors.black.withOpacity(0.35),
                ],
              ),
            ),
          ),

          // =====================================================
          // UI
          // =====================================================
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;

                return Stack(
                  children: [
                    // =================================================
                    // PLAYER INFO - KIRI ATAS
                    // =================================================
                    Positioned(
                      left: width * 0.025,
                      top: height * 0.025,
                      child: _playerInfo(),
                    ),

                    // =================================================
                    // TOP RIGHT - COIN / STREAK / SETTINGS
                    // =================================================
                    Positioned(
                      right: width * 0.025,
                      top: height * 0.025,
                      child: Row(
                        children: [
                          _statusBox(
                            icon: Icons.star_rounded,
                            value: '120',
                            color: const Color(0xFFFFD43B),
                          ),

                          const SizedBox(width: 10),

                          _statusBox(
                            icon: Icons.local_fire_department_rounded,
                            value: '4',
                            color: const Color(0xFFFF8A24),
                          ),

                          const SizedBox(width: 10),

                          _settingsButton(context),
                        ],
                      ),
                    ),

                    // =================================================
                    // LOGO / TITLE
                    // =================================================
                    Positioned(
                      top: height * 0.08,
                      left: 0,
                      right: 0,
                      child: Center(child: _gameLogo()),
                    ),

                    // =================================================
                    // MISSION PANEL
                    // =================================================
                    Positioned(
                      right: width * 0.045,
                      top: height * 0.34,
                      child: _missionPanel(context),
                    ),

                    // =================================================
                    // BOTTOM MENU
                    // =================================================
                    Positioned(
                      left: width * 0.035,
                      right: width * 0.035,
                      bottom: height * 0.025,
                      child: _bottomMenu(context),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // PLAYER INFO
  // ===========================================================

  Widget _playerInfo() {
    return Container(
      width: 205,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF082A50).withOpacity(0.92),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF0879C9), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF163C69),
              border: Border.all(color: const Color(0xFFFFD43B), width: 2),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 30),
          ),

          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Yasir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  'Lv. 2 Coder',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),

                const SizedBox(height: 5),

                // XP BAR
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.65,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00D9FF), Color(0xFF35D07F)],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  '65 / 100 XP',
                  style: TextStyle(color: Colors.white70, fontSize: 8),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // STATUS BOX
  // ===========================================================

  Widget _statusBox({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF082A50).withOpacity(0.92),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.20)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 21),

          const SizedBox(width: 5),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // SETTINGS
  // ===========================================================

  Widget _settingsButton(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF082A50).withOpacity(0.95),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(Icons.settings_rounded, color: Colors.white, size: 22),
        onPressed: () {
          _showComingSoon(context, 'Pengaturan');
        },
      ),
    );
  }

  // ===========================================================
  // GAME LOGO
  // ===========================================================

  Widget _gameLogo() {
    return Image.asset(
      'assets/backgrounds/04_logo.png',
      width: 200,
      fit: BoxFit.contain,
    );
  }

  // ===========================================================
  // MISSION PANEL
  // ===========================================================

  Widget _missionPanel(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF082A50).withOpacity(0.93),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF1D7CC5), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lanjutkan Misi',
            style: TextStyle(color: Colors.white70, fontSize: 10),
          ),

          const SizedBox(height: 3),

          const Text(
            'di Beginner Forest',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MapScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC928),
                foregroundColor: const Color(0xFF082A50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 3,
              ),
              child: const Text(
                'PLAY',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // BOTTOM MENU
  // ===========================================================

  Widget _bottomMenu(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _bottomButton(
            icon: Icons.person_rounded,
            title: 'Character',
            color: const Color(0xFF35D07F),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CharacterScreen()),
              );
            },
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _bottomButton(
            icon: Icons.map_rounded,
            title: 'World Map',
            color: const Color(0xFF00D9FF),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MapScreen()),
              );
            },
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _bottomButton(
            icon: Icons.emoji_events_rounded,
            title: 'Achievement',
            color: const Color(0xFFFFD43B),
            onTap: () {
              _showComingSoon(context, 'Achievement');
            },
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _bottomButton(
            icon: Icons.smart_toy_rounded,
            title: 'AI Tutor',
            color: const Color(0xFF8B5CF6),
            onTap: () {
              _showComingSoon(context, 'AI Tutor');
            },
          ),
        ),
      ],
    );
  }

  // ===========================================================
  // BOTTOM BUTTON
  // ===========================================================

  Widget _bottomButton({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 58,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(13),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: const Color(0xFF082A50).withOpacity(0.94),
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: color.withOpacity(0.65), width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 26),

                const SizedBox(width: 8),

                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===========================================================
  // COMING SOON
  // ===========================================================

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature sedang dalam tahap pengembangan.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
