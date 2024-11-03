import 'package:beauty/src/widget/component/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFD61355),
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(height: 20),
              Text(
                'Chào mừng đến với BeautyBox',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF202020),
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(height: 5),
              Text(
                'Khám phá thế giới làm đẹp không giới hạn',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF202020),
                ),
              ),
              SizedBox(height: 80),
             CustomButton(
                title: 'LOGIN',
                onPress: () {
                  context.go('/onnboarding'); 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
