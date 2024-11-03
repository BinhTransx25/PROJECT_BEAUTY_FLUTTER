import 'package:beauty/core/app_localizations.dart';
import 'package:beauty/core/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationTest extends StatelessWidget {
  const LocalizationTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(LocaleKeys.welcome.tr()),
      ),
      body: Column(
        children: [
          Center(
              child: Text(tr(LocaleKeys.hello),
            style: const TextStyle(fontSize: 20),
          )),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.setLocale(AppLocalizations.vietLocale);
              },
              child: const Text('Vietnamese')),
          ElevatedButton(onPressed: () {
            context.setLocale(AppLocalizations.engLocale);
          }, child: const Text('English')),
          ElevatedButton(onPressed: () {
            context.setLocale(AppLocalizations.thaiLocale);
          }, child: const Text('ThaiLand')),
        ],
      ),
    );
  }
}
