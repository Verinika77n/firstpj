import 'package:flutter/material.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({super.key, this.onTap});

  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.g_mobiledata,
          label: 'Google',
          onPressed: () => onTap?.call('Google'),
        ),
        const SizedBox(width: 14),
        _SocialButton(
          icon: Icons.apple,
          label: 'Apple',
          onPressed: () => onTap?.call('Apple'),
        ),
        const SizedBox(width: 14),
        _SocialButton(
          icon: Icons.email_outlined,
          label: 'Email',
          onPressed: () => onTap?.call('Email'),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Material(
        color: const Color(0xFF1C1C30),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.transparent,
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
