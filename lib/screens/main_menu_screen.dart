import 'package:flutter/material.dart';

import 'character_screen.dart';
import 'map_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08111F),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person),
                ),

                const SizedBox(width: 15),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yasir',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Level 1 • XP 0/100',
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            const Spacer(),

            const Icon(
              Icons.code,
              color: Colors.cyanAccent,
              size: 80,
            ),

            const SizedBox(height: 10),

            const Text(
              'MAIN MENU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _menuButton(
                  context,
                  Icons.play_arrow,
                  'MULAI PETUALANGAN',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MapScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 15),

                _menuButton(
                  context,
                  Icons.person,
                  'CHARACTER',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CharacterScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 15),

                _menuButton(
                  context,
                  Icons.emoji_events,
                  'ACHIEVEMENT',
                  () {},
                ),

                const SizedBox(width: 15),

                _menuButton(
                  context,
                  Icons.smart_toy,
                  'AI TUTOR',
                  () {},
                ),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 180,
      height: 110,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF14253A),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.cyanAccent,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}