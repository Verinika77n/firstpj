import 'package:flutter/material.dart';

import '../models/notification.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.item});

  final AppNotification item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        item.message,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: Text(
        item.timeLabel,
        style: const TextStyle(color: Color(0xFF9D9DB4), fontSize: 12),
      ),
    );
  }
}
