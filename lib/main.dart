import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'src/Screen/Address/Edit_Address.dart';
import 'src/app/app_router.dart';


void main() {
  runApp(MyApp());
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
      home: EditAddressScreen(), // Gọi màn hình mọi người đang code vào đây nha

    );
  }
}
