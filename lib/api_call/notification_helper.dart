import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationHelper {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() async {
    await _notification.initialize(
        const InitializationSettings(
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

    // Hiển thị thông báo
    await _notification.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  cancelAllNotifications() {
    _notification.cancelAll();
  }
}
