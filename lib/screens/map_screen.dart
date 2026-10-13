
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  static const Color navy = Color(0xFF08111F);
  static const Color cyan = Color(0xFF00E5FF);
  static const Color gold = Color(0xFFFFD54F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;

            return Stack(
              children: [
                // BACKGROUND HUTAN
                Positioned.fill(
                  child: Image.asset(
                    'assets/backgrounds/word_map.png',
                    fit: BoxFit.cover,
                  ),
                ),

                // DEKORASI POHON
                ...[
                  [0.05, 0.28],
                  [0.13, 0.43],
                  [0.23, 0.24],
                  [0.34, 0.36],
                  [0.42, 0.20],
                  [0.53, 0.32],
                  [0.65, 0.20],
                  [0.76, 0.33],
                  [0.88, 0.18],
                  [0.94, 0.44],
                  [0.08, 0.78],
                  [0.31, 0.82],
                  [0.56, 0.80],
                  [0.77, 0.76],
                  [0.91, 0.69],
                ].map(
                  (p) => Positioned(
                    left: w * (p[0] as double),
                    top: h * (p[1] as double),
                    child: Icon(
                      Icons.park,
                      size: w * 0.045,
                      color: const Color(0xFF185B36),
                    ),
                  ),
                ),

                // JALUR PETUALANGAN
                Positioned.fill(
                  child: CustomPaint(
                    painter: AdventurePathPainter(),
                  ),
                ),

                // KASTIL TUJUAN
                Positioned(
                  right: w * 0.055,
                  top: h * 0.17,
                  child: Column(
                    children: [
                      Icon(
                        Icons.castle,
                        size: w * 0.075,
                        color: const Color(0xFF583B83),
                      ),
                      const Text(
                        'GOAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 11,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // HEADER DUNIA
                Positioned(
                  top: 12,
                  left: 16,
                  right: 16,
                  child: Row(
                    children: [
                      _roundButton(
                        icon: Icons.arrow_back_rounded,
                        onTap: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xE6102030),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white24,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.forest,
                                color: Color(0xFF7CFF9B),
                                size: 30,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'BEGINNER FOREST',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'WORLD 1 • LEVEL 1',
                                      style: TextStyle(
                                        color: Color(0xFF7CFF9B),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.star_rounded,
                                color: gold,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                '120',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      _roundButton(
                        icon: Icons.pause_rounded,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: navy,
                              title: const Text(
                                'Petualangan Dijeda',
                                style: TextStyle(color: Colors.white),
                              ),
                              content: const Text(
                                'Kamu bisa melanjutkan petualangan '
                                'kapan saja.',
                                style: TextStyle(color: Colors.white70),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context),
                                  child: const Text('LANJUTKAN'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('KELUAR'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // TITIK LEVEL DI SEPANJANG JALUR
                _levelNode(
                  w: w,
                  h: h,
                  x: 0.12,
                  y: 0.69,
                  number: 1,
                  unlocked: true,
                  current: true,
                  onTap: () => _showLevel(context, 1),
                ),
                _levelNode(
                  w: w,
                  h: h,
                  x: 0.29,
                  y: 0.54,
                  number: 2,
                  unlocked: false,
                  onTap: null,
                ),
                _levelNode(
                  w: w,
                  h: h,
                  x: 0.46,
                  y: 0.63,
                  number: 3,
                  unlocked: false,
                  onTap: null,
                ),
                _levelNode(
                  w: w,
                  h: h,
                  x: 0.63,
                  y: 0.42,
                  number: 4,
                  unlocked: false,
                  onTap: null,
                ),
                _levelNode(
                  w: w,
                  h: h,
                  x: 0.79,
                  y: 0.47,
                  number: 5,
                  unlocked: false,
                  onTap: null,
                ),

                // PANEL MISI
                Positioned(
                  left: w * 0.30,
                  right: w * 0.30,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xF2102030),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: cyan.withValues(alpha: 0.7),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          color: gold,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Misi Petualangan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                'Pelajari dasar pemrograman!',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _showLevel(context, 1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: gold,
                            foregroundColor: navy,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'MULAI',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Widget _roundButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: const Color(0xE6102030),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: SizedBox(
          width: 46,
          height: 46,
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }

  static Widget _levelNode({
    required double w,
    required double h,
    required double x,
    required double y,
    required int number,
    required bool unlocked,
    bool current = false,
    VoidCallback? onTap,
  }) {
    final double size = (w * 0.055).clamp(42.0, 60.0);

    return Positioned(
      left: w * x - size / 2,
      top: h * y - size / 2,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: unlocked
                    ? const Color(0xFFFFD54F)
                    : const Color(0xFF354451),
                shape: BoxShape.circle,
                border: Border.all(
                  color: current
                      ? Colors.white
                      : unlocked
                          ? const Color(0xFFFFF0A0)
                          : Colors.white38,
                  width: current ? 4 : 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: current
                        ? Colors.yellow.withValues(alpha: 0.55)
                        : Colors.black26,
                    blurRadius: current ? 16 : 6,
                  ),
                ],
              ),
              child: Icon(
                unlocked
                    ? Icons.star_rounded
                    : Icons.lock_rounded,
                color: unlocked
                    ? const Color(0xFF7B4D00)
                    : Colors.white70,
                size: size * 0.48,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: const Color(0xDD102030),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showLevel(BuildContext context, int level) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: navy,
        title: Text(
          'Level $level',
          style: const TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Selamat datang di Beginner Forest! '
          'Di sini kamu akan belajar dasar pemrograman.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('SIAP!'),
          ),
        ],
      ),
    );
  }
}

class AdventurePathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 0.12, size.height * 0.69)
      ..cubicTo(
        size.width * 0.15,
        size.height * 0.56,
        size.width * 0.22,
        size.height * 0.49,
        size.width * 0.29,
        size.height * 0.54,
      )
      ..cubicTo(
        size.width * 0.35,
        size.height * 0.58,
        size.width * 0.39,
        size.height * 0.69,
        size.width * 0.46,
        size.height * 0.63,
      )
      ..cubicTo(
        size.width * 0.53,
        size.height * 0.57,
        size.width * 0.56,
        size.height * 0.39,
        size.width * 0.63,
        size.height * 0.42,
      )
      ..cubicTo(
        size.width * 0.70,
        size.height * 0.44,
        size.width * 0.72,
        size.height * 0.53,
        size.width * 0.79,
        size.height * 0.47,
      )
      ..cubicTo(
        size.width * 0.84,
        size.height * 0.42,
        size.width * 0.87,
        size.height * 0.30,
        size.width * 0.91,
        size.height * 0.25,
      );

    // Tepi jalur
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFF67472C)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 20
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // Permukaan jalur
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFFFFD98A)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 13
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // Garis putus-putus di tengah jalur
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFFB9854B)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
