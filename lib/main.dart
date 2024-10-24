import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src_demo/firebase/firebase_messaging.dart';
import 'src_demo/firebase/analytics_screen.dart'; // Màn hình Firebase Analytics
import 'src_demo/firebase/auth_screen.dart'; // Màn hình Firebase Auth
import 'src_demo/firebase/remote_config_screen.dart'; // Màn hình Firebase Remote Config
import 'src_demo/widget/check_internet_screen.dart'; // Màn hình Check Internet

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp()); // Khởi tạo ứng dụng
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo Firebase Messaging service
    FirebaseMessagingService().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Main'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnalyticsScreen()),
                );
              },
              child: Text('Go to Firebase Analytics'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              child: Text('Go to Firebase Auth'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RemoteConfigScreen()),
                );
              },
              child: Text('Go to Firebase Remote Config'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckInternet()),
                );
              },
              child: Text('Go to Check Internet'),
            ),
          ],
        ),
      ),
    );
  }
}
