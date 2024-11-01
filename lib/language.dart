import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello_world').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                String newLang = context.locale.languageCode == 'en' ? 'vi' : 'en';
                changeLanguage(context, newLang);
              },
              child: Text('change_language').tr(),
            ),
          ],
        ),
      ),
    );
  }

  void changeLanguage(BuildContext context, String langCode) {
    Locale newLocale = Locale(langCode);
    context.setLocale(newLocale);
  }
}
