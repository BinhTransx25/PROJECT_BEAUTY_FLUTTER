import 'dart:async';

import 'package:flutter/material.dart';

class Verificationcode extends StatefulWidget {
  const Verificationcode({super.key});

  @override
  State<Verificationcode> createState() => _VerificationcodeState();
}

class _VerificationcodeState extends State<Verificationcode> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  Timer? _timer;
  int _start = 30;
  bool _isResendEnabled = false;

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
      // Thực hiện hành động gửi lại mã
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding:  EdgeInsets.only(left: 20.0), // Thay đổi giá trị 20.0 theo ý muốn
              child: Align(
                alignment: Alignment.centerLeft,
                child:  Text(
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0,right: 100), // Thay đổi giá trị 20.0 theo ý muốn
              child: Align(
                alignment: Alignment.centerLeft,
                child:  Text(
                  'Mã xác minh đã dược gửi đến aaa@gmail.com',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF979797)
                  ),
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
                      decoration: InputDecoration(
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
              onTap: () {
                // Xử lý khi người dùng nhấn vào nút
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40, // Đảm bảo nút chiếm toàn bộ chiề
                height: 50, // Đặt chiều cao cụ thể cho nút
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Bo góc
                  color: Color(0xffD61355), // Màu nền
                ),
                alignment: Alignment.center, // Căn giữa chữ bên trong nút
                child: const Text(
                  'Gửi mã xác minh',
                  style: TextStyle(
                    color: Colors.white, // Đặt màu chữ trắng
                    fontSize: 16, // Đặt kích thước chữ
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Xử lý khi người dùng nhấn vào nút
                String code = _controllers.map((controller) => controller.text).join();
                print('Verification code: $code');
              },
              child: const Text('Trở về', style: TextStyle(color: Color(0xff202020), fontSize: 16)),
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
                      text: _isResendEnabled ? 'Gửi lại' : 'Gửi lại ($_start giây)',
                      style: const TextStyle(
                        color:  Color(0xffD61355) ,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
