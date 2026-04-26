import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_notifier.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool wifiOnly = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 38,
            backgroundColor: Color(0xFF2C2C45),
            child: Icon(Icons.person, size: 38, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Вероника П.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              '0 часов просмотра  •  0 избранных',
              style: TextStyle(color: Color(0xFFA8A8BE)),
            ),
          ),
          const SizedBox(height: 22),
          _SettingsTile(
            title: 'Сменить пароль',
            onTap: () => _showAction('Сменить пароль'),
          ),
          _SettingsTile(
            title: 'Сменить почту',
            onTap: () => _showAction('Сменить почту'),
          ),
          _SettingsTile(
            title: 'Изменить имя (логин)',
            onTap: () => _showAction('Изменить имя (логин)'),
          ),
          SwitchListTile(
            value: wifiOnly,
            onChanged: (value) => setState(() => wifiOnly = value),
            title: const Text('Загрузка только по Wi-Fi'),
            activeColor: const Color(0xFF5C4CDB),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {
              context.read<AuthNotifier>().logout();
              context.go('/logged-out');
            },
            icon: const Icon(Icons.logout),
            label: const Text('Выйти из аккаунта'),
          ),
        ],
      ),
    );
  }

  void _showAction(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Нажато: $title')),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white70),
    );
  }
}
