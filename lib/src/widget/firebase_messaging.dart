import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    // Request permission for iOS
    await _firebaseMessaging.requestPermission();

    // Lấy token
    String? token = await _firebaseMessaging.getToken();
    print("Firebase Messaging Token: $token"); // In token ra console

   
  }
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}
