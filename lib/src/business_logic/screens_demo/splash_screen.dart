import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
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
                    'lib/src/assets/Ellipse.png',
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'lib/src/assets/Obsidian.png',
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

