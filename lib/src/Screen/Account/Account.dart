import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Text(
                'Tài Khoản',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(color: Color(0xFFD9D9D9), thickness: 2),

            // List of options
            _buildOptionRow(
              context,
              image:
                  'lib/src/assets/Account/user.png', // Hình ảnh cho tùy chọn thông tin cá nhân
              label: 'Thông tin cá nhân',
              onTap: () {
                // Navigate to personal info page
              },
            ),
            _buildDividerWithPadding(),

            _buildOptionRow(
              context,
              image:
                  'lib/src/assets/Account/credit.png', // Hình ảnh cho tùy chọn phương thức thanh toán
              label: 'Phương thức thanh toán',
              onTap: () {
                // Navigate to payment methods
              },
            ),
            _buildDividerWithPadding(),

            _buildOptionRow(
              context,
              image:
                  'lib/src/assets/Account/notification.png', // Hình ảnh cho tùy chọn thông báo
              label: 'Thông báo',
              onTap: () {
                // Navigate to notifications
              },
            ),
            _buildDividerWithPadding(),

            _buildOptionRow(
              context,
              image:
                  'lib/src/assets/Account/question.png', // Hình ảnh cho tùy chọn câu hỏi thường gặp
              label: 'Câu hỏi thường gặp',
              onTap: () {
                // Navigate to FAQs
              },
            ),
            _buildDividerWithPadding(),

            _buildOptionRow(
              context,
              image:
                  'lib/src/assets/Account/help.png', // Hình ảnh cho tùy chọn trung tâm trợ giúp
              label: 'Trung tâm trợ giúp',
              onTap: () {
                // Navigate to help center
              },
            ),
            _buildDividerWithPadding(),

            // Logout option
            ListTile(
              leading: Image.asset('lib/src/assets/Account/logout.png',
                  color: Color(0xFFF81140)), // Hình ảnh cho nút đăng xuất
              title: Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFF81140),
                ),
              ),
              onTap: () {
                // Logout action
              },
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }

  // Widget cho mỗi dòng tùy chọn
  Widget _buildOptionRow(BuildContext context,
      {required String image,
      required String label,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Image.asset(image, width: 25, height: 25),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: Image.asset('lib/src/assets/Account/ArrowRight.png',
          width: 25, height: 25), // Hình ảnh cho mũi tên chỉ dẫn
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 5),
    );
  }

  // Widget cho divider với padding bên trái
  Widget _buildDividerWithPadding() {
    return Divider(
      color: Color(0xFFD9D9D9),
      thickness: 2,
      indent: 40, // Padding để phù hợp với độ căn chỉnh của các nhãn
    );
  }
}
