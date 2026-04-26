import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CircleAvatar(
            radius: 38,
            backgroundColor: Color(0xFF2C2C45),
            child: Icon(Icons.person, size: 38, color: Colors.white),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              'Вероника П.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              '0 часов просмотра  •  0 избранных',
              style: TextStyle(color: Color(0xFFA8A8BE)),
            ),
          ),
          SizedBox(height: 22),
          _SettingsTile(title: 'Сменить пароль'),
          _SettingsTile(title: 'Сменить почту'),
          _SettingsTile(title: 'Изменить имя (логин)'),
          _SettingsTile(title: 'Загрузка только по Wi-Fi'),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white70),
    );
  }
}
