import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() async {
    await _notification.initialize(const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    ));
  }

  static showNotification(
    String title,
    String body,
  ) async {
    var androidDetails = const AndroidNotificationDetails(
      "important_notification",
      "My Channel",
      importance: Importance.max,
      priority: Priority.high,
    );
    var notificationDetails = NotificationDetails(android: androidDetails);
    //tạo id random (đảm bảo mỗi thông báo là duy nhất)
    int notificationId = Random().nextInt(100000);
    // Hiển thị thông báo
    await _notification.show(
      notificationId,
      title,
      body,
      notificationDetails,
    );
  }

  cancelAllNotifications() {
    _notification.cancelAll();
  }
}
