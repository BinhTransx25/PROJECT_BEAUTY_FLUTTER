import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chờ đi (Splash Screen)', 
        style: TextStyle(fontSize: 24)),
      ),
    );
  }
}