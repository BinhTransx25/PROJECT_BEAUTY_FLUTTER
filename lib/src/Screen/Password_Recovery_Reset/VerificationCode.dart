import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Verificationcode extends StatefulWidget {
  final String email;
  final String previousPage;
  const Verificationcode({super.key, required this.email, required this.previousPage});


  @override
  State<Verificationcode> createState() => _VerificationcodeState();
}

class _VerificationcodeState extends State<Verificationcode> {
  String otp = '';
  String errorOTP = '';
  bool isLoading=false;
  final Dio _dio = Dio();


  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
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

  void _resendCode()async {
    if (_isResendEnabled) {
      // Thực hiện hành động gửi lại mã
      final response = await _dio.post(
        'https://api-core.dsp.one/api/password/send-otp',
        data: {'email': widget.email},
      );
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
    _timer?.cancel();
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
  Future<void> handleVerifyOTP() async {
    setState(() {
      otp = _controllers.map((controller) => controller.text).join();
      if (otp.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('OTP không được để trống.')),
        );
      } else {
        errorOTP = '';
      }
    });

    if (errorOTP.isEmpty) {
      setState(() {
        isLoading = true;
      });

      try {
        final response = await _dio.post(
          'https://api-core.dsp.one/api/password/verify-otp',
          data: {'email': widget.email, 'otp': otp}
        );

        print('response: ${response.data}');

        setState(() {
          isLoading = false;
        });

        final Map<String, dynamic> responseData = jsonDecode(response.toString());

        if (responseData['message'] == 'OTP hợp lệ. Bạn có thể đổi mật khẩu.') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('OTP đã được xác minh thành công.')),
          );
          context.go('/resetpassword' ,extra: {'email': widget.email,});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Xác minh OTP thất bại. Vui lòng thử lại.')),
          );
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print('error123: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Có lỗi xảy ra. Vui lòng thử lại.')),
        );
      }
    }
  }
  // late String previousPage; // Biến lưu tên trang trước
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   // Nhận tham số từ trang trước đó với null check
  //   final routeState = GoRouter.of(context).state;
  //   previousPage = routeState?.extra as String? ??
  //       'unknown'; // Sử dụng giá trị mặc định nếu extra là null
  // }

  void _goBack() {
    if (widget.previousPage == 'sms') {
      context.go('/passwordRecoveryPhone'); // Trở về trang SMS
    } else if (widget.previousPage == 'email') {
      context.go('/passwordRecoveryEmail'); // Trở về trang Email
    } else {
      context.pop(); // Hoặc quay lại trang trước nếu không có thông tin cụ thể
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
              padding: EdgeInsets.only(
                  left: 20.0), // Thay đổi giá trị 20.0 theo ý muốn
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
              padding: const EdgeInsets.only(
                  left: 20.0, right: 100), // Thay đổi giá trị 20.0 theo ý muốn
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mã xác minh đã dược gửi đến ${widget.email}',
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
                handleVerifyOTP();
                // context.go('/resetpassword' ,extra: {'email': widget.email,});
              },
              child: Container(
                width: MediaQuery.of(context).size.width -
                    40, // Đảm bảo nút chiếm toàn bộ chiề
                height: 50, // Đặt chiều cao cụ thể cho nút
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Bo góc
                  color: Color(0xffD61355), // Màu nền
                ),
                alignment: Alignment.center, // Căn giữa chữ bên trong nút
                child:isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Xác minh',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _goBack,
              // () {
              //   // Xử lý khi người dùng nhấn vào nút
              //   String code =
              //       _controllers.map((controller) => controller.text).join();
              //   print('Verification code: $code');
              // },
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
