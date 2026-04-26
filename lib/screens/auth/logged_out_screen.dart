import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/collage_background.dart';
import '../../widgets/social_auth_row.dart';

class LoggedOutScreen extends StatelessWidget {
  const LoggedOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CollageBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  const Text(
                    'Смотрите любимые фильмы\nв одном приложении',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, height: 1.2),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.go('/login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C4CDB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Войти'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => context.go('/register/step1'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF8D8DB0)),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Зарегистрироваться'),
                  ),
                  const SizedBox(height: 22),
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
