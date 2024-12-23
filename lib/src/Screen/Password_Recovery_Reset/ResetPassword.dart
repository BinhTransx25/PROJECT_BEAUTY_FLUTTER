import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Resetpassword extends StatefulWidget {
  final String email;
  const Resetpassword({super.key, required this.email});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Đóng modal
                  context.go('/signin'); // Điều hướng về trang login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD61355), // Màu nền nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bo góc nút
                  ),
                ),
                child: const Text(
                  'Đồng ý',
                  style: TextStyle(
                    color: Colors.white, // Màu chữ nút
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _ResetpasswordState extends State<Resetpassword> {
  String password = '';
  String confirmPassword = '';
  String errorPassword = '';
  String errorConfirmPassword = '';
  final Dio _dio = Dio();

  Future<void> resetPassword() async {
    setState(() {
      errorPassword = '';
      errorConfirmPassword = '';
    });

    if (password.isEmpty) {
      setState(() {
        errorPassword = '* Mật khẩu mới không được để trống';
      });
      return;
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        errorConfirmPassword = '* Xác nhận mật khẩu không được để trống';
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        errorConfirmPassword = '* Mật khẩu xác nhận không trùng khớp';
      });
      return;
    }

    try {
      final response = await Dio().post(
        'https://api-core.dsp.one/api/password/reset-password',
        data: {'email':widget.email,'new_password': password, 'new_password_confirmation': confirmPassword},
      );

      final responseData = jsonDecode(response.toString());
      if (responseData['message'] == 'Mật khẩu đã được cập nhật thành công.') {
        _showSuccessModal(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Đổi mật khẩu thất bại. Vui lòng thử lại.')),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Có lỗi xảy ra. Vui lòng thử lại.')),
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
              padding: EdgeInsets.only(
                  left: 20.0), // Thay đổi giá trị 20.0 theo ý muốn
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
              padding: EdgeInsets.only(
                  left: 20.0, right: 100), // Thay đổi giá trị 20.0 theo ý muốn
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
              height: 50, // Đặt chiều cao cụ thể cho Container
              margin: const EdgeInsets.only(left: 20, right: 20), // Màu nền đen
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), // Bo góc
                color: const Color(0xffF8F8F8),
              ), // Thêm khoảng cách giữa chữ và mép
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
                      style: const TextStyle(
                          color: Colors
                              .black), // Đặt màu chữ để dễ nhìn trên nền đen
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0), // Thêm khoảng cách bên phải
                    child: Image.asset(
                      'lib/src/assets/ResetPassword/eye.png',
                      width: 20, // Đặt chiều rộng cho hình ảnh
                      height: 20, // Đặt chiều cao cho hình ảnh
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
              height: 50, // Đặt chiều cao cụ thể cho Container
              margin: const EdgeInsets.only(left: 20, right: 20), // Màu nền đen
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), // Bo góc
                color: const Color(0xffF8F8F8),
              ), // Thêm khoảng cách giữa chữ và mép
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
                      style: const TextStyle(
                          color: Colors
                              .black), // Đặt màu chữ để dễ nhìn trên nền đen
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0), // Thêm khoảng cách bên phải
                    child: Image.asset(
                      'lib/src/assets/ResetPassword/eye.png',
                      width: 20, // Đặt chiều rộng cho hình ảnh
                      height: 20, // Đặt chiều cao cho hình ảnh
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
                    style: TextStyle(color: Color(0xffEF2E2E), fontSize: 12),
                  ),
                ),
              ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (password.isEmpty) {
                    errorPassword =
                        '* Mật khẩu mới không được trùng với mật khẩu cũ';
                  } else {
                    errorPassword = '';
                  }

                  if (confirmPassword.isEmpty) {
                    errorConfirmPassword =
                        '* Mật khẩu đã nhập không trùng với mật khẩu mới tạo';
                  } else if (password != confirmPassword) {
                    errorConfirmPassword =
                        '* Mật khẩu đã nhập không trùng với mật khẩu mới tạo';
                  } else {
                    errorConfirmPassword = '';
                  }

                  if (errorPassword.isEmpty && errorConfirmPassword.isEmpty) {
                    _showSuccessModal(context);
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width -
                    40, // Đảm bảo nút chiếm toàn bộ chiề
                height: 50, // Đặt chiều cao cụ thể cho nút
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Bo góc
                  color: const Color(0xffD61355), // Màu nền
                ),
                alignment: Alignment.center, // Căn giữa chữ bên trong nút
                child: const Text(
                  'Đổi mật khẩu',
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
                context.go('/passwordRecovery');
              },
              child: const Text('Trở về',
                  style: TextStyle(color: Color(0xff202020), fontSize: 16)),
            )
          ],
        ));
  }
}
