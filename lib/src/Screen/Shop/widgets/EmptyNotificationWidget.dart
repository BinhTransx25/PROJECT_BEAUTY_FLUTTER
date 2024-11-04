// lib/widgets/EmptyNotificationWidget.dart
import 'package:flutter/material.dart';

class EmptyNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            color: Colors.grey,
            size: 80,
          ),
          SizedBox(height: 16),
          Text(
            'Hiện tại bạn không có thông báo mới',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Bạn sẽ nhận được thông báo nếu\ncó gì đó thay đổi',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
