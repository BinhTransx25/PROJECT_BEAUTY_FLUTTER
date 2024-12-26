import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/button/custom_button.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/widgets/text_fields/custom_text_field.dart';
import 'package:beauty/src/api/auth_service.dart';
import 'package:beauty/src/models/user/user_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../bloc/login_bloc/login_bloc.dart';
// import '../../bloc/login_bloc/login_event.dart';
import '../../bloc/login_bloc/login_state.dart';

class SigninScreen extends StatefulWidget {
  @override
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
      final userRequest = UserRequest(
        name: '',
        nickName: '',
        email: emailController.text.trim(),
        address: '',
        phone: '',
        password: passwordController.text.trim(),
        passwordConfirmation: passwordController.text.trim(),
        customerId: 1,
      );
      try {
        final authService = AuthService();
        final success = await authService.login(userRequest);
        if (success) {
          Fluttertoast.showToast(
            msg: 'Đăng nhập thành công',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          context.go('/bottomTab');
        } else {
          Fluttertoast.showToast(
            msg: 'Đăng nhập thất bại',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } catch (e) {}
    } else if (emailError == null && passwordError == null) {
      Fluttertoast.showToast(
        msg: 'Vui lòng nhập đầy đủ thông tin',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Vui lòng kiểm tra thông tin đăng nhập',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Fluttertoast.showToast(
              msg: 'Đăng nhập thành công',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else if (state is LoginFailure) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: Container(
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
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 14),
              Text(
                'Vui lòng điền thông tin của bạn.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff979797),
                  fontWeight: FontWeight.w700,
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
                  onPressed: () {
                    context.push('/passwordRecovery');
                  },
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
              SizedBox(height: 20),
              CustomButton(
                title: 'Đăng ký',
                onPress: () {
                  context.push('/sign_up');
                },
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
                        context.go('/onnboarding');
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
      ),
    );
  }
}
