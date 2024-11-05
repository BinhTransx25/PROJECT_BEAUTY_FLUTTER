import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đã đăng nhập', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut(); // Đăng xuất
              },
              child: Text('Đăng xuất'),
            ),
          ],
        ),
      ),
    );
  }
}