import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signInAnonymously(); // Giả lập đăng nhập ẩn danh
          },
          child: Text('Đăng nhập ẩn danh'),
        ),
      ),
    );
  }
}