// import 'package:firebase_core/firebase_core.dart';
import 'package:beauty/src/Screen/Home/HomeScreennn.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'src/Screen/Home/homedemo.dart';
// import 'src/Screen/Product_detail/Product_detail.dart';
// import 'src/app/app_router.dart';





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

/** 
class MyApp extends StatelessWidget {
    final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // home: HomeScreennnn(),  Gọi màn hình mọi người đang code vào đây nha
      routerConfig: _appRouter.router,

    );
  }
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeScreen(), // Gọi màn hình mọi người đang code vào đây nha
    );
  }
}
