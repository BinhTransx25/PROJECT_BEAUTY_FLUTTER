// DemoScreens.dart
import 'package:flutter/material.dart';
import 'firebase/analytics_screen.dart'; 
import 'firebase/auth_screen.dart'; 
import 'firebase/remote_config_screen.dart'; 
import 'widget/check_internet_screen.dart'; 
import 'widget/LanguageSwitcher.dart';

class DemoScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Screens'),
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
