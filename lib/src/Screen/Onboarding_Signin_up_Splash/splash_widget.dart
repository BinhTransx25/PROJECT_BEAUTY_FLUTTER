// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../bloc/login_bloc/login_state.dart';

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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitial) {
          context.go(
              '/signin'); // Điều hướng về trang đăng nhập nếu ở trạng thái LoginInitial
        } else if (state is LoginSuccess) {
          context.go('/home'); // Điều hướng đến trang home nếu đã đăng nhập
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
