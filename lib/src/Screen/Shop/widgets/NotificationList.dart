// lib/widgets/NotificationList.dart
import 'package:flutter/material.dart';
import 'NotificationTile.dart';

class NotificationList extends StatelessWidget {
  final List<Map<String, String>> notifications;

  NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        for (int i = 0; i < notifications.length; i++) ...[
          if (i == 0 ||
              notifications[i]['date'] != notifications[i - 1]['date'])
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                notifications[i]['date']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          NotificationTile(
            title: notifications[i]['title']!,
            description: notifications[i]['description']!,
          ),
          Divider(),
        ],
      ],
    );
  }
}
