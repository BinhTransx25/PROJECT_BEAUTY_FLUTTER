// import 'package:firebase_core/firebase_core.dart';
import 'package:beauty/src/Screen/Password%20Recovery.dart';
import 'package:beauty/src/Screen/PasswordRecoveryEmail.dart';
import 'package:beauty/src/Screen/PasswordRecoveryPhone.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'src/Screen/helloWorld.dart'; // Import Màn hình mọi người đang test nha

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
      debugShowCheckedModeBanner: false,
      home: PasswordRecoveryPhone(), // Gọi màn hình mọi người đang code vào đây nha
    );
  }
}
