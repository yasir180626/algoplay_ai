import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF08111F),
      appBar: AppBar(
        title: const Text('World Map'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          children: [
            Expanded(
              child: _worldCard(
                'BEGINNER FOREST',
                'Algorithm\nVariables\nData Types',
                Icons.forest,
                true,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: _worldCard(
                'CODING CITY',
                'Operators\nIf / Else\nBoolean',
                Icons.location_city,
                false,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: _worldCard(
                'LOOP CASTLE',
                'For Loop\nWhile Loop\nNested Loop',
                Icons.castle,
                false,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: _worldCard(
                'DEBUG LAB',
                'Debugging\nCode Puzzle\nBug Hunter',
                Icons.science,
                false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _worldCard(
    String title,
    String description,
    IconData icon,
    bool unlocked,
  ) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: unlocked
            ? const Color(0xFF142F2A)
            : const Color(0xFF1A1F29),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: unlocked
              ? Colors.cyanAccent
              : Colors.white12,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            unlocked ? icon : Icons.lock,
            size: 80,
            color: unlocked
                ? Colors.cyanAccent
                : Colors.white38,
          ),

          const SizedBox(height: 20),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: unlocked
                  ? Colors.white
                  : Colors.white38,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: unlocked
                  ? Colors.white70
                  : Colors.white24,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            unlocked ? 'UNLOCKED' : 'LOCKED',
            style: TextStyle(
              color: unlocked
                  ? Colors.cyanAccent
                  : Colors.white30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}