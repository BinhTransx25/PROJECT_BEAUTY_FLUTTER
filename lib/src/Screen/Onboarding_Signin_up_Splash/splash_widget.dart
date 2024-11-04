// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class SplashWidget extends StatefulWidget {
  @override
  State<SplashWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 3), () {

      context.go("/onnboardingstart");
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Image.asset(
                    'lib/src/assets/Onboarding_Signin_up_Splash/Ellipse.png',
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'lib/src/assets/Onboarding_Signin_up_Splash/Obsidian.png',
                  ),
                ),
              ],
            ),
            SizedBox(height: 46),
            Text(
              'BeautyBox',
              style: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD61355),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
