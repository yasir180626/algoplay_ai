
import 'package:flutter/material.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  static const Color background = Color(0xFF08111F);
  static const Color panel = Color(0xFF14253A);
  static const Color cyan = Color(0xFF00E5FF);
  static const Color gold = Color(0xFFFFD54F);
  static const Color purple = Color(0xFFB388FF);

  static const List<Map<String, dynamic>> achievements = [
    {
      'title': 'First Steps',
      'description': 'Selesaikan level pertamamu.',
      'icon': Icons.flag_rounded,
      'unlocked': true,
      'progress': 1.0,
      'reward': '+100 XP',
      'color': gold,
    },
    {
      'title': 'Code Explorer',
      'description': 'Jelajahi dunia Beginner Forest.',
      'icon': Icons.forest_rounded,
      'unlocked': true,
      'progress': 1.0,
      'reward': '+50 XP',
      'color': Colors.greenAccent,
    },
    {
      'title': 'Bug Hunter',
      'description': 'Selesaikan 5 tantangan debugging.',
      'icon': Icons.bug_report_rounded,
      'unlocked': false,
      'progress': 0.4,
      'reward': '+150 XP',
      'color': cyan,
    },
    {
      'title': 'Perfect Coder',
      'description': 'Selesaikan level tanpa kesalahan.',
      'icon': Icons.workspace_premium_rounded,
      'unlocked': false,
      'progress': 0.0,
      'reward': '+200 XP',
      'color': gold,
    },
    {
      'title': 'Streak Master',
      'description': 'Belajar selama 7 hari berturut-turut.',
      'icon': Icons.local_fire_department_rounded,
      'unlocked': false,
      'progress': 0.29,
      'reward': '+250 XP',
      'color': purple,
    },
    {
      'title': 'Algorithm Master',
      'description': 'Kuasai seluruh tantangan algoritma.',
      'icon': Icons.psychology_rounded,
      'unlocked': false,
      'progress': 0.0,
      'reward': '+300 XP',
      'color': purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unlockedCount = achievements
        .where((item) => item['unlocked'] == true)
        .length;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _header(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _summary(unlockedCount),
                    const SizedBox(height: 28),
                    const Text(
                      'YOUR ACHIEVEMENTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Terus belajar untuk membuka semua lencana!',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 18),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final columns =
                            constraints.maxWidth >= 850 ? 3 :
                            constraints.maxWidth >= 520 ? 2 : 1;

                        final cardWidth =
                            (constraints.maxWidth -
                                (columns - 1) * 16) /
                            columns;

                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            for (final item in achievements)
                              SizedBox(
                                width: cardWidth,
                                child: _achievementCard(item),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 22, 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ACHIEVEMENTS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Koleksi pencapaian petualanganmu',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.stars_rounded,
            color: gold,
            size: 26,
          ),
          const SizedBox(width: 6),
          const Text(
            '120',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _summary(int unlockedCount) {
    final progress = unlockedCount / achievements.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF183D55),
            Color(0xFF20294B),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: cyan.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: gold.withValues(alpha: 0.12),
              shape: BoxShape.circle,
              border: Border.all(
                color: gold,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: gold,
              size: 42,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Achievement Progress',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$unlockedCount dari ${achievements.length} pencapaian terbuka',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: Colors.white12,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(gold),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${(progress * 100).round()}% selesai',
                  style: const TextStyle(
                    color: gold,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _achievementCard(Map<String, dynamic> item) {
    final unlocked = item['unlocked'] as bool;
    final color = item['color'] as Color;
    final progress = item['progress'] as double;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: unlocked ? color.withValues(alpha: 0.65) : Colors.white12,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: unlocked
                      ? color.withValues(alpha: 0.13)
                      : Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(
                  unlocked
                      ? item['icon'] as IconData
                      : Icons.lock_rounded,
                  color: unlocked ? color : Colors.white30,
                  size: 34,
                ),
              ),
              const Spacer(),
              if (unlocked)
                Icon(
                  Icons.check_circle_rounded,
                  color: color,
                  size: 23,
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            item['title'] as String,
            style: TextStyle(
              color: unlocked ? Colors.white : Colors.white54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            item['description'] as String,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Icon(
                Icons.bolt_rounded,
                color: gold,
                size: 19,
              ),
              const SizedBox(width: 5),
              Text(
                item['reward'] as String,
                style: const TextStyle(
                  color: gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                unlocked ? 'UNLOCKED' : 'LOCKED',
                style: TextStyle(
                  color: unlocked ? color : Colors.white30,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          if (!unlocked) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: Colors.white10,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${(progress * 100).round()}% progres',
              style: const TextStyle(
                color: Colors.white38,
                fontSize: 11,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
