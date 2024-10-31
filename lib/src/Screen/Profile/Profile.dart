import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 24),
                  const Expanded(
                    child: Text(
                      'Thông Tin Cá Nhân',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFFD9D9D9)),

            // Hình ảnh đại diện
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: ClipOval(
                  child: Image.asset(
                    'lib/src/assets/Account/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),

            // Các trường thông tin
            _buildTextField(label: 'Tên đầy đủ', hint: 'Nguyễn Văn A'),
            _buildTextField(label: 'Email', hint: 'abc@gmail.com'),
            _buildTextField(
              label: 'Ngày sinh',
              hint: '9/9/2000',
              suffixIcon: Icons.calendar_today,
            ),
            _buildTextField(
              label: 'Giới tính',
              hint: 'Nam',
              suffixIcon: Icons.arrow_drop_down,
            ),
            _buildTextField(label: 'Số điện thoại', hint: '+84 020 234 567'),

            // Nút xác nhận
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, top: 15),
              child: SizedBox(
                width: double.infinity, // Chiếm toàn bộ chiều rộng
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD61355), // Màu D61355
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

  // Widget cho các trường thông tin
  Widget _buildTextField(
      {required String label, required String hint, IconData? suffixIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8), // Khoảng cách giữa các trường
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tiêu đề label với khoảng cách 5 điểm
          Padding(
            padding: const EdgeInsets.only(
                bottom: 5.0), // Khoảng cách 5 điểm dưới label
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 149, 145, 145)),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(
                        255, 182, 221, 243)), // Màu viền khi ô được chọn
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hint,
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.only(left: 5),
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(suffixIcon, size: 20),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
