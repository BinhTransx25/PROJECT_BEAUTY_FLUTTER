import 'package:flutter/material.dart';

void main() {
  runApp(shop());
}

class shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'date': 'Hôm nay',
      'title': 'Mã giảm 30% trên đơn hàng',
      'description': 'Áp dụng trong ngày',
    },
    {
      'date': 'Hôm qua',
      'title': 'Kết nối ví thanh toán thành công',
      'description': 'Bạn đã thêm một ví thanh toán',
    },
    {
      'date': 'Hôm qua',
      'title': 'Đã thêm một địa chỉ',
      'description': 'Bạn có thể xem địa chỉ',
    },
    {
      'date': '10/9/2024',
      'title': 'Cập nhật mật khẩu thành công',
      'description': 'Mật khẩu của bạn đã được cập nhật',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Thông Báo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold, // In đậm chữ "Thông Báo"
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          for (int i = 0; i < notifications.length; i++) ...[
            if (i == 0 ||
                notifications[i]['date'] != notifications[i - 1]['date'])
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  notifications[i]['date']!,
                  style: TextStyle(
                    fontWeight: (notifications[i]['date'] == 'Hôm nay' ||
                            notifications[i]['date'] == 'Hôm qua' ||
                            notifications[i]['date'] == '10/9/2024')
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.grey),
              // title: Text(notifications[i]['title']!),
              title: Text(
                notifications[i]['title']!,
                style: TextStyle(
                    fontWeight:(notifications[i]['title'] ==
                                'Mã giảm 30% trên đơn hàng' ||
                            notifications[i]['title'] ==
                                'Kết nối ví thanh toán thành công' ||
                            notifications[i]['title'] ==
                                'Đã thêm một địa chỉ' ||
                            notifications[i]['title'] ==
                                'Cập nhật mật khẩu thành công')
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
              subtitle: Text(notifications[i]['description']!),
            ),
            Divider(),
          ],
        ],
      ),
    );
  }
}
