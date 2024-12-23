import 'package:beauty/src/api/auth_service.dart';
import 'package:beauty/src/models/user/user_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PasswordRecoveryEmail extends StatefulWidget {
  const PasswordRecoveryEmail({super.key});

  @override
  State<PasswordRecoveryEmail> createState() => _PasswordRecoveryEmailState();
}

class _PasswordRecoveryEmailState extends State<PasswordRecoveryEmail> {
  final TextEditingController _emailController = TextEditingController();

  Future<void> _onSendCodePressed(BuildContext context) async {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập email')),
      );
      return; // Nếu email trống, không thực hiện tiếp
    }

    final authService = AuthService();
    final userRequest = UserRequest(
      name: 'name',
      nickName: 'nickName',
      email: email,
      address: "123 Street",
      phone: 'phone',
      password: 'password',
      passwordConfirmation: 'password',
      customerId: 1,
    );

    try {
      // Kiểm tra và gửi OTP
      final otpSuccess = await authService.otp(userRequest);

      if (otpSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mã xác nhận đã gửi đến email')),
        );
        context.go('/verificationcode',
            extra: email); // Chuyển hướng sau khi thành công
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Không thể gửi mã xác nhận. Vui lòng thử lại.')),
        );
      }
    } catch (e) {
      print('Lỗi khi gửi OTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lỗi xác nhận mã. Vui lòng thử lại sau.')),
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
                  'Quên mật khẩu',
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
              padding: EdgeInsets.only(left: 20.0, right: 100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nhập email của bạn, chúng tôi sẽ gửi OTP để xác minh.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF979797)),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Color(0xffF8F8F8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _emailController, // Sử dụng controller
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Color(0XFF979797),
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.email_outlined,
                      color: Color(0xFF979797),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => _onSendCodePressed(context),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffD61355),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Gửi mã xác minh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                context.go("/passwordRecovery");
              },
              child: const Text('Trở về',
                  style: TextStyle(color: Color(0xff202020), fontSize: 16)),
            )
          ],
        ));
  }
}
