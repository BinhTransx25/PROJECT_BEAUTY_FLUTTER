import 'package:flutter/material.dart';
import 'src/Screen/Account/Account.dart';
// import 'src/app/app_router.dart';


void main() {
  runApp(MyApp());

}

/** 
class MyApp extends StatelessWidget {
    final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      home: AccountScreen(), // Gọi màn hình mọi người đang code vào đây nha

    );
  }
}
