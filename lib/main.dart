
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/widget/firebase_messaging.dart'; 


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService().init(); // Khởi tạo dịch vụ Firebase Messaging
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo main'),
      ),
      body: const Center(
        child: Text('demo main'),
      ),
    );
  }
}

