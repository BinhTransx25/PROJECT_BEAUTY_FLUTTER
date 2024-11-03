import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/avatar_widget.dart';
import 'widgets/profile_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const Divider(color: Color(0xFFD9D9D9)),
            const AvatarWidget(),
            const ProfileTextField(label: 'Tên đầy đủ', hint: 'Nguyễn Văn A'),
            const ProfileTextField(label: 'Email', hint: 'abc@gmail.com'),
            const ProfileTextField(label: 'Ngày sinh', hint: '9/9/2000', suffixIcon: Icons.calendar_today),
            const ProfileTextField(label: 'Giới tính', hint: 'Nam', suffixIcon: Icons.arrow_drop_down),
            const ProfileTextField(label: 'Số điện thoại', hint: '+84 020 234 567'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, top: 15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD61355),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Hành động khi nhấn nút Xác nhận
                  },
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
