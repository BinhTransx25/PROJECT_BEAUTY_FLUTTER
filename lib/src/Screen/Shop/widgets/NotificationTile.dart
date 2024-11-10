// lib/widgets/NotificationTile.dart
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;

  NotificationTile({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.grey),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description,
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey)),
    );
  }
}
