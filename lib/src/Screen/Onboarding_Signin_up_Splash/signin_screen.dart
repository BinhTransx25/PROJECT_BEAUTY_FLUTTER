import 'package:flutter/material.dart';
import '../../service/auth_api.dart';
import '../../models/user/user_model.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthApi _authApi = AuthApi();

  void _handleLogin() async {
    final email = _identifierController.text;
    final password = _passwordController.text;

    // Kiểm tra dữ liệu nhập
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng điền đầy đủ thông tin!')),
      );
      return;
    }

    // Tạo model người dùng
    final userModel = UserModel(email: email, password: password, name: '');

    // Gọi API đăng nhập
    final isLoggedIn = await _authApi.login(userModel);

    if (isLoggedIn) {
      context.go('/home'); // Điều hướng tới trang chính
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thất bại. Vui lòng thử lại!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _identifierController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}
