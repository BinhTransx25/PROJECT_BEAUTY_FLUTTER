import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart'; // Import go_router
import 'widgets/Account_widget.dart';
class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            // Header
            Header(),
            Divider(color: Color(0xFFD9D9D9), thickness: 2),

            // List of options
            OptionRow(
              image: 'lib/src/assets/Account/user.png',
              label: 'Thông tin cá nhân',
              onTap: () {
                // Điều hướng tới trang thông tin cá nhân
                context.go('/personal_info');
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/credit.png',
              label: 'Phương thức thanh toán',
              onTap: () {
                // Điều hướng tới trang phương thức thanh toán
                context.go('/payment_methods');
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/notification.png',
              label: 'Thông báo',
              onTap: () {
                // Điều hướng tới trang thông báo
                context.go('/notifications');
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/question.png',
              label: 'Câu hỏi thường gặp',
              onTap: () {
                // Điều hướng tới trang câu hỏi thường gặp
                context.go('/FAQs');
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/help.png',
              label: 'Trung tâm trợ giúp',
              onTap: () {
                // Điều hướng tới trang trung tâm trợ giúp
                context.go('/help_center');
              },
            ),
            DividerWithPadding(),

            // Logout option
            ListTile(
              leading: Image.asset('lib/src/assets/Account/logout.png',
                  color: Color(0xFFF81140)),
              title: Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFF81140),
                ),
              ),
              onTap: () {
                // Hiển thị hộp thoại xác nhận đăng xuất
                _showLogoutDialog(context);
              },
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm hiển thị hộp thoại đăng xuất
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Không tắt được bằng cách nhấn ngoài
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Border radius
          ),
          backgroundColor: Colors.white, // Màu nền trắng
          elevation: 5, // Đổ bóng
          contentPadding: EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('lib/src/assets/Account/logout.png', height: 40), // Hình ảnh
              SizedBox(height: 10),
              Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Bạn có chắc muốn đăng xuất?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Nút Hủy
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Đóng hộp thoại
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey, // Màu nút hủy
                    ),
                    child: Text('Hủy'),
                  ),
                  // Nút Xác nhận
                  ElevatedButton(
                    onPressed: () {
                      // Hiển thị Toast và chuyển về màn hình login
                      Fluttertoast.showToast(
                        msg: "Bạn đã đăng xuất",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                      );

                      // Chuyển về màn hình Login
                      context.go('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF81140), // Màu đỏ
                    ),
                    child: Text('Xác nhận'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
