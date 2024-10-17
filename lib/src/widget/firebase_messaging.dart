import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Request permission for iOS (bỏ qua nếu bạn chỉ build cho Android)
    await _firebaseMessaging.requestPermission();

    // Lấy token
    String? token = await _firebaseMessaging.getToken();
    print("Firebase Messaging Token: $token"); // In token ra console

    // Lắng nghe thông báo khi ứng dụng đang chạy (foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a foreground message: ${message.notification?.title}, ${message.notification?.body}');
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked and opened app: ${message.notification?.title}');

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