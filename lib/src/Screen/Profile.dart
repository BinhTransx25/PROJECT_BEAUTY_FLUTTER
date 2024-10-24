import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dòng đầu tiên: Hình và tiêu đề
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Image.network(
                    'https://example.com/icon.png', // Thay bằng URL hình ảnh
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Thông Tin Cá Nhân',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Thanh ngang
            Divider(color: Color(0xFFD9D9D9)),
            // Hình ảnh đại diện
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ClipOval(
                  child: Image.network(
                    'https://example.com/profile_image.jpg', // Thay bằng URL hình ảnh
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Tên đầy đủ
            Text('Tên đầy đủ', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nguyễn Văn A',
                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 5),
                ),
              ),
            ),
            // Email
            Text('Email', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'abc@gmail.com',
                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 5),
                ),
              ),
            ),
            // Ngày sinh
            Text('Ngày sinh', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: '9/9/2000',
                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 5),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.calendar_today, size: 10),
                  ),
                ),
              ),
            ),
            // Giới tính
            Text('Giới tính', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Nam',
                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 5),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.arrow_drop_down, size: 10),
                  ),
                ),
              ),
            ),
            // Số điện thoại
            Text('Số điện thoại', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: '+84 020 234 567',
                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: EdgeInsets.only(left: 5),
                ),
              ),
            ),
            // Nút xác nhận
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD61355), // Màu D61355
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
