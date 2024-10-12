import 'package:flutter/material.dart';
import 'package:my_app/checkinternet.dart';
import 'package:my_app/loadingscreen.dart';
import 'package:my_app/loadingscreen2.dart';
import 'package:my_app/notfindscrren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: CheckInternet(),
    );
  }
}
