import 'package:flutter/material.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(icon: Icons.g_mobiledata, label: 'Google'),
        SizedBox(width: 14),
        _SocialButton(icon: Icons.apple, label: 'Apple'),
        SizedBox(width: 14),
        _SocialButton(icon: Icons.email_outlined, label: 'Email'),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xFF1C1C30),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
