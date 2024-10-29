import 'package:flutter/material.dart';
import 'src/Screen/helloWorld.dart'; // Import Màn hình mọi người đang test
import 'src/Screen//MyOrder//Ongoing_complete/Ongoing.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Ongoing(), // Gọi màn hình Ongoing vào đây
    );
  }
}
