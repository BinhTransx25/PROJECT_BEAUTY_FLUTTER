import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingDetailScreen extends StatelessWidget {
  // Giả sử bạn đã lấy dữ liệu setting từ API và truyền vào constructor
  late final Map<String, dynamic> setting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết cài đặt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên: ${setting['name']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Mã: ${setting['code']}'),
            Text('Slug: ${setting['slug']}'),
            Text('Giá trị: ${setting['value']}'),
            Text('Loại: ${setting['type']}'),
            SizedBox(height: 10),
            Text('Dữ liệu:'),
            if (setting['data'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (setting['data'] as List).map((item) {
                  return Text('- $item');
                }).toList(),
              ),
            SizedBox(height: 10),
            Text('Ngày tạo: ${setting['created_at']}'),
            Text('Ngày cập nhật: ${setting['updated_at']}'),
          ],
        ),
      ),
    );
  }
}
