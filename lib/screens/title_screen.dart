import 'package:flutter/material.dart';

import 'main_menu_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07111E),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF102A43),
                    Color(0xFF07111E),
                  ],
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.code,
                  size: 90,
                  color: Colors.cyanAccent,
                ),

                const SizedBox(height: 15),

                const Text(
                  'ALGOPLAY AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'LEARN • PLAY • CODE',
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 16,
                    letterSpacing: 3,
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: 220,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainMenuScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'MULAI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}