
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ValueNotifier<String?> selectedCharacterAsset =
    ValueNotifier<String?>(null);

const String _characterKey = 'selected_character_asset';
int _selectionRevision = 0;

// Membaca karakter yang tersimpan di perangkat.
Future<void> loadSelectedCharacter() async {
  final revision = _selectionRevision;
  final prefs = await SharedPreferences.getInstance();
  if (revision == _selectionRevision) {
    selectedCharacterAsset.value = prefs.getString(_characterKey);
  }
}

// Menyimpan karakter yang dipilih.
Future<void> saveSelectedCharacter(String imagePath) async {
  _selectionRevision++;
  selectedCharacterAsset.value = imagePath;
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_characterKey, imagePath);
}

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    loadSelectedCharacter();
  }

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
                    name: 'TIMO',
                    description: 'Karakter laki-laki',
                    color: Colors.cyanAccent,
                  ),
                  _characterCard(
                    imagePath: 'assets/characters/player_female.png',
                    name: 'MILO',
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

          // Tombol otomatis berubah sesuai karakter yang tersimpan.
          ValueListenableBuilder<String?>(
            valueListenable: selectedCharacterAsset,
            builder: (context, selectedPath, child) {
              final isSelected = selectedPath == imagePath;

              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await saveSelectedCharacter(imagePath);

                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$name berhasil dipilih!'),
                        ),
                      );
                    } catch (e, stackTrace) {
                      debugPrint('GAGAL MENYIMPAN KARAKTER: $e');
                      debugPrintStack(stackTrace: stackTrace);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? const Color(0xFF35D07F)
                        : color,
                    foregroundColor: const Color(0xFF08111F),
                    disabledBackgroundColor: const Color(0xFF35D07F),
                    disabledForegroundColor: const Color(0xFF08111F),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isSelected ? 'KARAKTER DIPILIH' : 'PILIH KARAKTER',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
