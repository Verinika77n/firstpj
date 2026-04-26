import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/collage_background.dart';
import '../../widgets/social_auth_row.dart';

class RegisterStep1Screen extends StatelessWidget {
  const RegisterStep1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CollageBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Регистрация — шаг 1', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 24),
                  const TextField(decoration: InputDecoration(labelText: 'Электронная почта')),
                  const SizedBox(height: 12),
                  const TextField(decoration: InputDecoration(labelText: 'Код')),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go('/register/step2'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C4CDB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Подтвердить'),
                  ),
                  const SizedBox(height: 18),
                  const SocialAuthRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
