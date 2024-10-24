import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('hello_world').tr(), // Hiển thị văn bản từ file ngôn ngữ
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newLang =
                    context.locale.languageCode == 'en' ? 'vi' : 'en';
                changeLanguage(context, newLang);
                setState(() {});
              },
              child: Text('change_language').tr(), // Nút chuyển đổi ngôn ngữ
            ),
          ],
        ),
      ),
    );
  }
}

void changeLanguage(BuildContext context, String langCode) {
  Locale newLocale = Locale(langCode);
  context.setLocale(newLocale); // Thay đổi ngôn ngữ
}
