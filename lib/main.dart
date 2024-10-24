import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'src_demo/widget/LanguageSwitcher.dart'; // Import màn hình chuyển đổi ngôn ngữ
import 'src_demo/firebase/firebase_messaging.dart';
import 'src_demo/firebase/analytics_screen.dart'; 
import 'src_demo/firebase/auth_screen.dart'; 
import 'src_demo/firebase/remote_config_screen.dart'; 
import 'src_demo/widget/check_internet_screen.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('vi')],
      path: 'assets/translations', // Đường dẫn tới file ngôn ngữ
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
            // Nút điều hướng tới LanguageSwitcher
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguageSwitcher()),
                );
              },
              child: Text('Go to Language Switcher'),
            ),
          ],
        ),
      ),
    );
  }
}
