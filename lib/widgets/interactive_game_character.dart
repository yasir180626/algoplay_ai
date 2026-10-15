
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class InteractiveGameCharacter extends StatefulWidget {
  final String imagePath;

  const InteractiveGameCharacter({
    super.key,
    required this.imagePath,
  });

  @override
  State<InteractiveGameCharacter> createState() =>
      _InteractiveGameCharacterState();
}

class _InteractiveGameCharacterState
    extends State<InteractiveGameCharacter>
    with TickerProviderStateMixin {
  late final AnimationController _idleController;
  late final AnimationController _tapController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Animasi otomatis selama karakter berada di layar.
    _idleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    // Animasi reaksi ketika karakter disentuh.
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }


  Future<void> _react() async {
    debugPrint('KARAKTER DIKLIK');

    _tapController.forward(from: 0);

    final audioFile = widget.imagePath.contains('female')
        ? 'audio/sfx/character_female.mp3'
        : 'audio/sfx/character_male.mp3';

    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(audioFile));

      debugPrint('Audio dijalankan: $audioFile');
    } catch (e) {
      debugPrint('ERROR AUDIO: $e');
    }
  }


  @override
  void dispose() {
    _idleController.dispose();
    _tapController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _react,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _idleController,
          _tapController,
        ]),
        builder: (context, child) {
          // Gerakan bernapas.
          final breath =
              -3.0 * _idleController.value;

          // Goyangan kecil kiri dan kanan.
          final sway = 0.025 *
              ((_idleController.value * 2) - 1);

          // Pantulan ketika disentuh.
          final jump =
              24 * (4 * _tapController.value *
                  (1 - _tapController.value));

          return Transform.translate(
            offset: Offset(0, breath - jump),
            child: Transform.rotate(
              angle: sway,
              alignment: Alignment.bottomCenter,
              child: child,
            ),
          );
        },
        child: Image.asset(
          widget.imagePath,
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
