import 'package:beauty/src/business_logic/authentication/authentication_builder.dart';
import 'package:beauty/src/business_logic/screens_demo/home_screen.dart';
import 'package:beauty/src/business_logic/screens_demo/sign_in_page.dart';
import 'package:beauty/src/business_logic/screens_demo/splash_screen.dart';
import 'package:beauty/src/business_logic/splash/splash_builder.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart'; // Thêm Firebase Core để khởi tạo Firebase


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(); // Khởi tạo Firebase
  runApp(MyAppDemo());
}

class MyAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashBuilder(
        onInit: () async {
          await Future.delayed(Duration(seconds: 3)); // Giả lập chờ 3 giây
        },
        splashScreen: SplashScreen(),
        homeScreen: AuthenticationBuilder(
          builder: (context, user) {
            if (user == null) {
              return SignInPage(); // Chưa đăng nhập
            } else {
              return HomePage(); // Đã đăng nhập
            }
          },
        ),
      ),
    );
  }
}


