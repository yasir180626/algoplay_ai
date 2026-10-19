
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Palet warna tema AlgoPlay AI
  static const Color backgroundColor = Color(0xFF101729);
  static const Color cardColor = Color(0xFF1A2840);
  static const Color accentColor = Color(0xFF78F0C5);
  static const Color mutedColor = Color(0xFF9EABC4);
  static const Color borderColor = Color(0xFF34445C);

  // Data sementara untuk tampilan awal.
  // Ganti dengan data pemain sebenarnya setelah integrasi selesai.
  static const String playerName = 'Yasir';
  static const String playerTitle = 'Rookie Coder';
  static const int playerLevel = 1;
  static const int currentXp = 120;
  static const int nextLevelXp = 200;
  static const int completedChallenges = 8;
  static const int streakDays = 3;

  @override
  Widget build(BuildContext context) {
    final double xpProgress =
        (currentXp / nextLevelXp).clamp(0.0, 1.0).toDouble();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Kembali',
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'PLAYER PROFILE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Pengaturan',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pengaturan akan dikembangkan.'),
                ),
              );
            },
            icon: const Icon(
              Icons.settings_rounded,
              color: mutedColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              children: [
                _buildPlayerCard(xpProgress),
                const SizedBox(height: 22),
                _buildSectionTitle('PLAYER STATISTICS'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.emoji_events_rounded,
                        iconColor: const Color(0xFFF5C96A),
                        value: '$completedChallenges',
                        label: 'Challenges Done',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.local_fire_department_rounded,
                        iconColor: const Color(0xFFFF9966),
                        value: '$streakDays Days',
                        label: 'Learning Streak',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('ACHIEVEMENTS'),
                const SizedBox(height: 12),
                _buildAchievements(),
                const SizedBox(height: 24),
                _buildSectionTitle('ACCOUNT'),
                const SizedBox(height: 12),
                _buildAccountItem(
                  icon: Icons.person_outline_rounded,
                  title: 'Edit Profile',
                  subtitle: 'Ubah nama dan informasi pemain',
                  onTap: () => _showEditNameDialog(context),
                ),
                const SizedBox(height: 10),
                _buildAccountItem(
                  icon: Icons.school_outlined,
                  title: 'Learning Progress',
                  subtitle: 'Lihat perkembangan belajar',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Halaman progres belajar belum dihubungkan.',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                _buildAccountItem(
                  icon: Icons.info_outline_rounded,
                  title: 'About AlgoPlay AI',
                  subtitle: 'Aplikasi belajar algoritma dan pemrograman',
                  onTap: () => _showAboutDialog(context),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'LEARN • PLAY • LEVEL UP',
                    style: TextStyle(
                      color: mutedColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
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

  Widget _buildPlayerCard(double xpProgress) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: accentColor.withOpacity(0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.06),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.videogame_asset_rounded,
                color: accentColor,
                size: 22,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'ALGOPLAY AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              _levelBadge(),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: const Color(0xFF2C425D),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: accentColor,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 64,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            playerName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '$playerTitle • Beginner Forest',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: mutedColor,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'EXPERIENCE POINTS',
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              Text(
                '$currentXp / $nextLevelXp XP',
                style: const TextStyle(
                  color: accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: xpProgress,
              minHeight: 10,
              backgroundColor: borderColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                accentColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(xpProgress * 100).round()}% menuju target XP berikutnya',
            style: const TextStyle(
              color: mutedColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _levelBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: accentColor.withOpacity(0.45),
        ),
      ),
      child: Text(
        'LVL ${playerLevel.toString().padLeft(2, '0')}',
        style: const TextStyle(
          color: accentColor,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 14),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: mutedColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    return Row(
      children: [
        Expanded(
          child: _buildAchievementBadge(
            icon: Icons.code_rounded,
            title: 'First Code',
            color: accentColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildAchievementBadge(
            icon: Icons.bug_report_rounded,
            title: 'Bug Hunter',
            color: const Color(0xFFF5C96A),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildAchievementBadge(
            icon: Icons.psychology_rounded,
            title: 'Logic Master',
            color: const Color(0xFFBCA6FF),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementBadge({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 112),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accentColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: mutedColor,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: mutedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditNameDialog(BuildContext context) {
    final controller = TextEditingController(text: playerName);

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: cardColor,
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: controller,
            maxLength: 30,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Nama pemain',
              labelStyle: const TextStyle(color: mutedColor),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: accentColor),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Batal',
                style: TextStyle(color: mutedColor),
              ),
            ),
            FilledButton(
              onPressed: () {
                if (controller.text.trim().isEmpty) {
                  return;
                }

                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Contoh edit profil: simpan perubahan ke model '
                      'dan penyimpanan lokal pada tahap integrasi.',
                    ),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    ).then((_) => controller.dispose());
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'AlgoPlay AI',
      applicationVersion: '0.1.0',
      applicationLegalese:
          'Aplikasi pembelajaran algoritma dan pemrograman '
          'berbasis permainan interaktif.',
    );
  }
}
