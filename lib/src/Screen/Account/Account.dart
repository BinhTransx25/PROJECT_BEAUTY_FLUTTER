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
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('lib/src/assets/Account/logout.png', height: 40),
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
              // Nút Xác nhận
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "Bạn đã đăng xuất",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );

                    // Chuyển về màn hình Login
                    context.go('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF81140),
                    elevation: 3, // Đổ bóng
                  ),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Nút Hủy
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Đóng hộp thoại
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: const Color.fromARGB(
                            255, 216, 216, 216)), // Màu viền
                    backgroundColor: Colors.white, // Nền trắng
                  ),
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold), // Màu chữ đen
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
