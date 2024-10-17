import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:firebase_core/firebase_core.dart';
import 'src/widget/firebase_messaging.dart'; // Giữ lại để gọi Firebase Messaging

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService().init(); // Khởi tạo dịch vụ Firebase Messaging
  runApp(const MyApp());
=======

import 'src/widget/firebase_messaging_service.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FirebaseMessagingService().init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      path: 'assets/translations', 
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
>>>>>>> Stashed changes
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< Updated upstream
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
=======
      localizationsDelegates: context
          .localizationDelegates, 
      supportedLocales: context.supportedLocales, 
      locale: context.locale, 
      home: const LanguageSwitcher(), 
>>>>>>> Stashed changes
    );
  }
}

<<<<<<< Updated upstream
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
=======
class LanguageSwitcher extends StatefulWidget {
  LanguageSwitcher({super.key});

  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('hello_world').tr(), 
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
             
                String newLang =
                    context.locale.languageCode == 'en' ? 'vi' : 'en';
                changeLanguage(context, newLang);
              },
              child: const Text('change_language').tr(), 
            ),
          ],
        ),
>>>>>>> Stashed changes
      ),
    );
  }
}
<<<<<<< Updated upstream
=======

void changeLanguage(BuildContext context, String langCode) {
  // Hàm để đổi ngôn ngữ
  Locale newLocale = Locale(langCode);
  print('Changing language to: $langCode');
  context.setLocale(newLocale); 
}
>>>>>>> Stashed changes
