import 'package:flutter/material.dart';

class PasswordRecoveryPhone extends StatefulWidget {

  @override
  _PasswordRecoveryPhoneState createState() => _PasswordRecoveryPhoneState();
}

class _PasswordRecoveryPhoneState extends State<PasswordRecoveryPhone> {
  String value = '';
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
              padding: EdgeInsets.only(left: 20.0,right: 100), // Thay đổi giá trị 20.0 theo ý muốn
              child: Align(
                alignment: Alignment.centerLeft,
                child:  Text(
                  'Nhập số điện thoại của bạn, chúng tôi sẽ gửi OTP để xác minh.',
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
            Container(
              height: 50, // Đặt chiều cao cụ thể cho Container
              margin: const EdgeInsets.only(left: 20,right: 20),// Màu nền đen
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), // Bo góc
                color: const Color(0xffF8F8F8),
              ),// Thêm khoảng cách giữa chữ và mép
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          value = text;
                        });
                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Số điện thoại',
                        hintStyle: TextStyle(
                          color: Color(0XFF979797),
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(color: Colors.black), // Đặt màu chữ để dễ nhìn trên nền đen
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0), // Thêm khoảng cách bên phải
                    child: Image.asset('lib/src/assets/PasswordRecovery/phone.png',
                      width: 20, // Đặt chiều rộng cho hình ảnh
                      height: 20, // Đặt chiều cao cho hình ảnh
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print('User Input: $value');
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40, // Đảm bảo nút chiếm toàn bộ chiề
                height: 50, // Đặt chiều cao cụ thể cho nút
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Bo góc
                  color: const Color(0xffD61355), // Màu nền
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
              },
              child: const Text('Trở về', style: TextStyle(color: Color(0xff202020), fontSize: 16)),
            )
          ],
        )
    );;
  }
}
