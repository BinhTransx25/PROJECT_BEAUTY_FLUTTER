import 'package:beauty/core/app_localizations.dart';
import 'package:beauty/src/constants/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('vi')],
      path: AppLocalizations.translationFilePath,
      fallbackLocale: AppLocalizations.engLocale,
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerDelegate: MyAppRouter().router.routerDelegate,
//       routeInformationParser: MyAppRouter().router.routeInformationParser,
//       locale: context.locale,
//       supportedLocales: context.supportedLocales,
//       localizationsDelegates: context.localizationDelegates,
//       title: 'Flutter Demo',
//       theme: ThemeData(fontFamily: 'OpenSans'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router',
      routerConfig: MyAppRouter().router,
    );
  }
}
