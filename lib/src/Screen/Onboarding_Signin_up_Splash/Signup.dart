// ignore: file_names
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/button/custom_button.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? phoneError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void _validateField(String fieldType) {
    setState(() {
      if (fieldType == 'phone') {
        if (phoneController.text.trim().isEmpty) {
          phoneError = 'Vui lòng nhập số điện thoại';
        } else {
          phoneError = null;
        }
      } else if (fieldType == 'email') {
        if (emailController.text.trim().isEmpty) {
          emailError = 'Vui lòng nhập email';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
            .hasMatch(emailController.text)) {
          emailError = 'Email không hợp lệ';
        } else {
          emailError = null;
        }
      } else if (fieldType == 'password') {
        if (passwordController.text.isEmpty) {
          passwordError = 'Vui lòng nhập mật khẩu';
        } else {
          passwordError = null;
        }
      } else if (fieldType == 'confirmPassword') {
        if (confirmPasswordController.text.isEmpty) {
          confirmPasswordError = 'Vui lòng nhập lại mật khẩu';
        } else if (confirmPasswordController.text != passwordController.text) {
          confirmPasswordError = 'Mật khẩu không khớp';
        } else {
          confirmPasswordError = null;
        }
      }
    });
  }

  Future<void> _submit() async {
    _validateField('phone');
    _validateField('email');
    _validateField('password');
    _validateField('confirmPassword');

    setState(() {});
    if (phoneError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null) {
      try {
        context.go('/signin');
      } catch (e) {
       // ignore: avoid_print
       print('Lỗi đăng nhập Facebook: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Image.asset(
                      'lib/src/assets/Ellipse.png',
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      'lib/src/assets/Obsidian.png',
                      width: 45,
                      height: 58,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Đăng ký',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Vui lòng điền thông tin của bạn.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff979797),
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            SizedBox(height: 23),
            CustomTextField(
              controller: phoneController,
              suffixIcon: const Icon(Icons.phone),
              hintText: 'Số điện thoại',
              textError: phoneError ?? '',
              onChanged: (value) => _validateField('phone'),
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: emailController,
              suffixIcon: const Icon(Icons.email),
              hintText: 'Email',
              textError: emailError ?? '',
              onChanged: (value) => _validateField('email'),
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: passwordController,
              suffixIcon: const Icon(Icons.visibility),
              hintText: 'Mật khẩu',
              isPassword: true,
              textError: passwordError ?? '',
              onChanged: (value) => _validateField('password'),
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: confirmPasswordController,
              suffixIcon: const Icon(Icons.visibility),
              hintText: 'Nhập lại mật khẩu',
              isPassword: true,
              textError: confirmPasswordError ?? '',
              onChanged: (value) => _validateField('confirmPassword'),
            ),
            const SizedBox(height: 10),
            SizedBox(height: 20),
            CustomButton(
              title: 'Đăng ký',
              onPress: _submit,
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/onnboarding');
                    },
                    child: const Text(
                      "Trở về",
                      style: TextStyle(color: Color(0xff202020)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
