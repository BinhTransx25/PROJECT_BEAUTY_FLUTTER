import 'package:flutter/material.dart';
import 'widgets/Account_widget.dart'; // Import các widget đã tạo

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
                // Navigate to personal info page
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/credit.png',
              label: 'Phương thức thanh toán',
              onTap: () {
                // Navigate to payment methods
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/notification.png',
              label: 'Thông báo',
              onTap: () {
                // Navigate to notifications
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/question.png',
              label: 'Câu hỏi thường gặp',
              onTap: () {
                // Navigate to FAQs
              },
            ),
            DividerWithPadding(),

            OptionRow(
              image: 'lib/src/assets/Account/help.png',
              label: 'Trung tâm trợ giúp',
              onTap: () {
                // Navigate to help center
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
                // Logout action
              },
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ],
        ),
      ),
    );
  }
}
