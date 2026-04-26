import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/movies_notifier.dart';
import '../../widgets/horizontal_movie_list.dart';
import '../../widgets/notification_tile.dart';
import '../../widgets/section_header.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<MoviesNotifier>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Персональные уведомления',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView(
                children: [
                  ...data.notifications.map((item) => NotificationTile(item: item)),
                  const SizedBox(height: 10),
                  const SectionHeader(title: 'Отслеживаемые релизы'),
                  const SizedBox(height: 10),
                  HorizontalMovieList(movies: data.popularNow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
