import 'package:beauty/src/api/auth_service.dart';
import 'package:beauty/src/models/user/user_models.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({super.key});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  late String email;

  String password = '';
  String confirmPassword = '';
  String errorPassword = '';
  String errorConfirmPassword = '';

  @override
  void initState() {
    super.initState();
    final routeState = GoRouter.of(context).state;
    email = routeState?.extra as String? ?? 'unknown';
    print('Email passed to Resetpassword: $email');
  }

  void resetpassword() async {
    setState(() {
      errorPassword = '';
      errorConfirmPassword = '';
    });

    if (password.isEmpty) {
      setState(() {
        errorPassword = '* Mật khẩu mới không được trùng với mật khẩu cũ';
      });
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        errorConfirmPassword =
            '* Mật khẩu đã nhập không trùng với mật khẩu mới tạo';
      });
    } else if (password != confirmPassword) {
      setState(() {
        errorConfirmPassword =
            '* Mật khẩu đã nhập không trùng với mật khẩu mới tạo';
      });
    }

    if (errorPassword.isEmpty && errorConfirmPassword.isEmpty) {
      try {
        final userRequest = UserRequest(
          email: email,
          password: password,
          passwordConfirmation: confirmPassword,
          name: '',
          nickName: '',
          address: '',
          phone: '',
          customerId: 1,
        );

        final authService = AuthService();
        final success = await authService.resetpw(userRequest);

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thay đổi mật khẩu thành công'),
            ),
          );
          context.go('/signin');
        } else {
          setState(() {
            errorPassword = '* Có lỗi xảy ra. Vui lòng thử lại sau.';
          });
        }
      } catch (e) {
        setState(() {
          errorPassword = '* Đã xảy ra lỗi: ${e.toString()}';
        });
        print('Error during password reset: $e');
      }
    }
  }

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Thành công',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset('lib/src/assets/ResetPassword/success.png'),
                const SizedBox(height: 30),
                const Text(
                  'Đổi mật khẩu thành công!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
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
                'Đổi mật khẩu',
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
                'Vui lòng điền mật khẩu mới của bạn.',
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
            height: 50,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xffF8F8F8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        password = text;
                      });
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Mật khẩu mới',
                      hintStyle: TextStyle(
                        color: Color(0XFF979797),
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    'lib/src/assets/ResetPassword/eye.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          if (errorPassword.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  errorPassword,
                  style:
                      const TextStyle(color: Color(0xffEF2E2E), fontSize: 12),
                ),
              ),
            ),
          const SizedBox(height: 30),
          Container(
            height: 50,
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: const Color(0xffF8F8F8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        confirmPassword = text;
                      });
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Nhập lại mật khẩu mới',
                      hintStyle: TextStyle(
                        color: Color(0XFF979797),
                        fontSize: 14,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    'lib/src/assets/ResetPassword/eye.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          if (errorConfirmPassword.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  errorConfirmPassword,
                  style:
                      const TextStyle(color: Color(0xffEF2E2E), fontSize: 12),
                ),
              ),
            ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: resetpassword, // Gọi resetpassword từ đây
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffD61355),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Đổi mật khẩu',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.go('/passwordRecovery');
            },
            child: const Text(
              'Trở về',
              style: TextStyle(color: Color(0xff202020), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
