import 'package:flutter/material.dart';

class PasswordRecoveryEmail extends StatefulWidget {
  const PasswordRecoveryEmail({super.key});

  @override
  State<PasswordRecoveryEmail> createState() => _PasswordRecoveryEmailState();
}

class _PasswordRecoveryEmailState extends State<PasswordRecoveryEmail> {
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
                'Nhập email của bạn, chúng tôi sẽ gửi OTP để xác minh.',
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
            width: MediaQuery.of(context).size.width , // Đảm bảo Container chiếm toàn bộ chiều
            height: 50, // Đặt chiều cao cụ thể cho Container
            margin: const EdgeInsets.only(left: 20,right: 20),// Màu nền đen
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60), // Bo góc
              color: Color(0xffF8F8F8),
            ),// Thêm khoảng cách giữa chữ và mép
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0XFF979797),
                        fontSize: 14,
                      ),
                    ),
                    style: TextStyle(color: Colors.black), // Đặt màu chữ để dễ nhìn trên nền đen
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0), // Thêm khoảng cách bên phải
                  child: Image.network(
                    'https://s3-alpha-sig.figma.com/img/8af0/30e2/03f1071fa1bd51c5cfb950ef892cccaf?Expires=1731888000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=boQT44A9ufTQuQNfAjW3jY-IVI4rzUhLXHBtSHx4Ikb-bPzsGTLZlHYK0UbYhohz1IlvN5~ACZsXGqlqyFADNNpBVGcYUVTkeurVjVkG7byZ6UGBQ-tVi3nbudCqeYLVKV5-2jjoOfFd~Nrv3ytQ5BuuDTvIU-9HzIOCisZzR3e7md2ojwYxeP3pwedupRljO1HXBh8FFRK45KIvJ9bjIAPiKKa51p8jmdynBqXFlqcP7wYvXsMJ3HQtRTYDv-eEAXFhIoN~2qPYj-ovkLAT8gy7pbg6ZtTtU44ae~L-Im1vFRTuD9clxOU~t5P1ZuKOVVOIk4sqsUSfrf3wiLJ7bQ__', // Đường dẫn đến hình ảnh
                    width: 20, // Đặt chiều rộng cho hình ảnh
                    height: 20, // Đặt chiều cao cho hình ảnh
                  ),
                ),
              ],
            ),
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
            },
            child: const Text('Trở về', style: TextStyle(color: Color(0xff202020), fontSize: 16)),
          )
        ],
      )
    );
  }
}
