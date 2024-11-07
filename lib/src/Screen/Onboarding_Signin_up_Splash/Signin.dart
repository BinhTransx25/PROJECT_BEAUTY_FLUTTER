// ignore: file_names
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/button/custom_button.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  void _validateField(String fieldType) {
    setState(() {
      if (fieldType == 'email') {
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
      }
    });
  }

  Future<void> _submit() async {
    _validateField('email');
    _validateField('password');
    setState(() {});
    if (emailError == null && passwordError == null) {
      try {
        Fluttertoast.showToast(
          msg: 'Đăng nhập thành công',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e) {
        // Xử lý lỗi
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
                      'lib/src/assets/Onboarding_Signin_up_Splash/Ellipse.png',
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      'lib/src/assets/Onboarding_Signin_up_Splash/Obsidian.png',
                      width: 45,
                      height: 58,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Đăng nhập',
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
              controller: emailController,
              hintText: 'Email',
              textError: emailError ?? '',
              onChanged: (value) => _validateField('email'),
              suffixIcon: null,
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Quên mật khẩu?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tiếp tục với",
                    style: TextStyle(color: Color(0xff202020)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/src/assets/Onboarding_Signin_up_Splash/google.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  height: 51,
                  child: ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/src/assets/Onboarding_Signin_up_Splash/facebook.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Facebook',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
              title: 'Đăng nhập',
              onPress: _submit,
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            CustomButton(
              title: 'Đăng ký',
              onPress: () => {context.go('/signup')},
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: Color(0xffD61355),
                    width: 1,
                  ),
                ),
              ),
              textStyle: TextStyle(color: Color(0xffD61355), fontSize: 16),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/signup');
                    },
                    child: const Text(
                      "Trở về",
                      style: TextStyle(color: Color(0xff202020)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}