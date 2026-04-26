import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/collage_background.dart';
import '../../widgets/social_auth_row.dart';

class RegisterStep1Screen extends StatefulWidget {
  const RegisterStep1Screen({super.key});

  @override
  State<RegisterStep1Screen> createState() => _RegisterStep1ScreenState();
}

class _RegisterStep1ScreenState extends State<RegisterStep1Screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (!_emailController.text.contains('@') || _codeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Проверьте почту и код подтверждения')),
      );
      return;
    }
    context.go('/register/step2');
  }

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
                  TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Электронная почта')),
                  const SizedBox(height: 12),
                  TextField(controller: _codeController, decoration: const InputDecoration(labelText: 'Код')),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _nextStep,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C4CDB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Подтвердить'),
                  ),
                  const SizedBox(height: 18),
                  SocialAuthRow(
                    onTap: (provider) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Регистрация через $provider пока в разработке')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
