import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditAddressScreen extends StatefulWidget {
  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  bool isDefaultAddress = false;

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            // Đặt tiêu đề ở giữa
            child: Text(
              'Xóa địa chỉ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          titlePadding:
              EdgeInsets.only(top: 20, bottom: 10), // Thêm khoảng cách
          actionsAlignment: MainAxisAlignment.spaceBetween, // Căn đều hai bên
          actions: [
            // Nút "Hủy" với border
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Quay lại màn hình sửa địa chỉ
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey), // Viền xám
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Hủy', style: TextStyle(color: Colors.black)),
              ),
            ),
            // Nút "Xóa" với border đỏ
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
                Navigator.of(context).pop(); // Quay lại màn hình địa chỉ
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Địa chỉ đã được xóa')),
                );
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red), // Viền đỏ
                backgroundColor: Colors.red[50], // Màu nền nhẹ
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Xóa', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSuccessToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Đặt màu nền thành màu trắng

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 25),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Thực hiện hành động khi nhấn vào icon
                      print("Nút quay lại được nhấn");
                      context.go('/address'); // Quay lại màn hình trước
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Sửa Địa Chỉ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(
                color: Color(0xFFD9D9D9),
                thickness: 2,
              ),
            ),

            // Thông tin địa chỉ
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                'Thông tin địa chỉ',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Address TextField
            Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDADADA)),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Thông tin địa chỉ',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Tên nhãn
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: Text(
                'Tên nhãn',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Label TextField
            Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDADADA)),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tên nhãn',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Đặt làm địa chỉ mặc định
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(12.0), // Thêm padding cho checkbox
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDefaultAddress = !isDefaultAddress;
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Đổi thành hình tròn
                        color: isDefaultAddress
                            ? const Color.fromARGB(255, 213, 213, 213)
                            : Colors.transparent,
                        border: Border.all(
                            color: const Color.fromARGB(255, 209, 209, 209),
                            width: 2),
                      ),
                      child: isDefaultAddress
                          ? Icon(Icons.check, color: Colors.white, size: 16)
                          : null,
                    ),
                  ),
                ),
                SizedBox(width: 8), // Tạo khoảng cách giữa checkbox và text
                Text(
                  'Đặt làm địa chỉ mặc định',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            Spacer(),

            // Xóa địa chỉ button
            GestureDetector(
              onTap: showDeleteConfirmationDialog,
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDADADA)),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Xóa địa chỉ',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Hoàn thành button
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 25),
              child: GestureDetector(
                onTap: () {
                  showSuccessToast('Sửa địa chỉ thành công');
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFFD61355),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Hoàn Thành',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
