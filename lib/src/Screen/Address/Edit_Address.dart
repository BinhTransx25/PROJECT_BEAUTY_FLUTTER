import 'package:flutter/material.dart';

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
          title: Text('Xóa địa chỉ'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Quay lại màn hình sửa địa chỉ
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
                Navigator.of(context).pop(); // Quay lại màn hình địa chỉ
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Địa chỉ đã được xóa')),
                );
              },
              child: Text('Xóa', style: TextStyle(color: Colors.red)),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Spacer(),
                  Text(
                    'Sửa Địa Chỉ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 3),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Thông tin địa chỉ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            
            // Address TextField
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDADADA)),
                borderRadius: BorderRadius.circular(5),
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
              padding: const EdgeInsets.symmetric(vertical: 10.0),
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
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDADADA)),
                borderRadius: BorderRadius.circular(5),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isDefaultAddress,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isDefaultAddress = newValue ?? false;
                      });
                    },
                  ),
                  Text(
                    'Đặt làm địa chỉ mặc định',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
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
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Xóa địa chỉ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // Hoàn thành button
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  showSuccessToast('Sửa địa chỉ thành công');
                },
                child: Container(
                  width: double.infinity,
                  height: 61,
                  decoration: BoxDecoration(
                    color: Color(0xFFD61355),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Hoàn Thành',
                    style: TextStyle(
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
