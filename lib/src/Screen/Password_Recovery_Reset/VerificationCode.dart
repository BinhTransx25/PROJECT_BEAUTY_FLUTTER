import 'dart:async';

import 'package:beauty/src/api/auth_service.dart';
import 'package:beauty/src/models/user/user_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Verificationcode extends StatefulWidget {
  const Verificationcode({super.key});

  @override
  State<Verificationcode> createState() => _VerificationcodeState();
}

class _VerificationcodeState extends State<Verificationcode> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _start = 60;
  bool _isResendEnabled = false;

  late String email;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _isResendEnabled = false;
    _start = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _isResendEnabled = true;
          timer.cancel();
        }
      });
    });
  }

  void _resendCode() {
    if (_isResendEnabled) {
      startTimer();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  late String previousPage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeState = GoRouter.of(context).state;
    email = routeState?.extra as String? ?? 'unknown';
  }

  final authService = AuthService();

  void _goBack() {
    if (previousPage == 'sms') {
      context.go('/passwordRecoveryPhone');
    } else if (previousPage == 'email') {
      context.go('/passwordRecoveryEmail');
    } else {
      context.pop();
    }
  }

  Future<void> verifyOtp() async {
    final otp = _controllers.map((controller) => controller.text.trim()).join();

    if (otp.length == 6 && email.isNotEmpty) {
      final otpRequest = OtpRequest(email: email, otp: otp);

      try {
        final success = await authService.veriotp(otpRequest);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP xác thực thành công!')),
          );
          context.go('/resetpassword',extra: email);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP không hợp lệ, vui lòng thử lại!')),
          );
        }
      } catch (e) {
        print("Lỗi xác thực OTP: $e");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lỗi kết nối, vui lòng thử lại sau!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập OTP hợp lệ!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.asset('lib/src/assets/PasswordRecovery/logo.png'),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Xác thực OTP',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mã xác minh đã dược gửi đến $email',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF979797)),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => _onChanged(value, index),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: verifyOtp,
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffD61355),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Xác minh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _goBack,
              child: const Text('Trở về',
                  style: TextStyle(color: Color(0xff202020), fontSize: 14)),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _resendCode,
              child: RichText(
                text: TextSpan(
                  text: 'Không nhận được mã? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: _isResendEnabled
                          ? 'Gửi lại'
                          : 'Gửi lại ($_start giây)',
                      style: const TextStyle(
                        color: Color(0xffD61355),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
