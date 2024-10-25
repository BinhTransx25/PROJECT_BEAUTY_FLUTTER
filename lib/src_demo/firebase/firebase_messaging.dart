import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init(BuildContext context) async {
    // Request permission for iOS (bỏ qua nếu bạn chỉ build cho Android)
    await _firebaseMessaging.requestPermission();

    // Lấy token
    final token = await _firebaseMessaging.getToken();
    print("Firebase Messaging Token: $token"); // In token ra console

    // Lắng nghe thông báo khi ứng dụng đang chạy (foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a foreground message: ${message.notification?.title}, ${message.notification?.body}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked and opened app: ${message.notification?.title}');
      // Điều hướng đến màn hình Messaging khi nhấn vào thông báo
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MessagingScreen(message)),
      );
    });

    // Đăng ký hàm xử lý thông báo khi app đang ở background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

// Hàm xử lý thông báo khi ứng dụng chạy nền hoặc bị đóng
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
}

// Màn hình hiển thị thông tin từ Firebase Messaging
class MessagingScreen extends StatelessWidget {
  final RemoteMessage message;

  const MessagingScreen(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Messaging'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${message.notification?.title ?? 'N/A'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Body: ${message.notification?.body ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
