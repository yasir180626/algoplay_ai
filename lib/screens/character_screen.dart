import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08111F),
      appBar: AppBar(
        title: const Text('Character'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'PILIH KARAKTER',
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Pilih karakter untuk petualanganmu!',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 25),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 25,
                runSpacing: 25,
                children: [
                  _characterCard(
                    imagePath: 'assets/characters/player_front.png',
                    name: 'CODER',
                    description: 'Karakter laki-laki',
                    color: Colors.cyanAccent,
                  ),
                     _characterCard(
                    imagePath: 'assets/characters/player_female.png',
                    name: 'CODE GIRL',
                    description: 'Karakter perempuan',
                    color: const Color(0xFFB388FF),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _characterCard({
  required String imagePath,
  required String name,
  required String description,
  required Color color,
}) {
  return Container(
    width: 220,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF14253A),
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: color, width: 2),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 280,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {
            debugPrint('Karakter dipilih: $name');
          },
          child: const Text('PILIH KARAKTER'),
        ),
      ],
    ),
  );
}
}