import 'package:flutter/material.dart';

class SocialAuthOptions extends StatelessWidget {
  const SocialAuthOptions({required this.onProviderSelected, super.key});

  final ValueChanged<String> onProviderSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3))),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'ATAU LANJUTKAN DENGAN',
                style: TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ),
            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.3))),
          ],
        ),
        const SizedBox(height: 12),
        _ProviderButton(
          label: 'Google / Gmail',
          icon: Icons.g_mobiledata,
          onPressed: () => onProviderSelected('Google / Gmail'),
        ),
        const SizedBox(height: 8),
        _ProviderButton(
          label: 'Facebook',
          icon: Icons.facebook,
          onPressed: () => onProviderSelected('Facebook'),
        ),
        const SizedBox(height: 8),
        _ProviderButton(
          label: 'Apple',
          icon: Icons.apple,
          onPressed: () => onProviderSelected('Apple'),
        ),
      ],
    );
  }
}

class _ProviderButton extends StatelessWidget {
  const _ProviderButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 22),
      label: Text('Lanjutkan dengan $label'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(44),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.35)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
