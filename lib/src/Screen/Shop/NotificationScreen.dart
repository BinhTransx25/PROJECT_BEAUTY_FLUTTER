// lib/screens/NotificationScreen.dart
import 'package:flutter/material.dart';
import 'widgets/AppBarWidget.dart';
import 'widgets/EmptyNotificationWidget.dart';
import 'widgets/NotificationList.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'date': 'Hôm nay',
      'title': 'Mã giảm 30% trên đơn hàng',
      'description': 'Áp dụng trong ngày',
    },
    {
      'date': 'Hôm qua',
      'title': 'Kết nối ví thanh toán thành công',
      'description': 'Bạn đã thêm một ví thanh toán',
    },
    {
      'date': 'Hôm qua',
      'title': 'Đã thêm một địa chỉ',
      'description': 'Bạn có thể xem địa chỉ',
    },
    {
      'date': '10/9/2024',
      'title': 'Cập nhật mật khẩu thành công',
      'description': 'Mật khẩu của bạn đã được cập nhật',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: notifications.isEmpty
          ? EmptyNotificationWidget()
          : NotificationList(notifications: notifications),
    );
  }
}
