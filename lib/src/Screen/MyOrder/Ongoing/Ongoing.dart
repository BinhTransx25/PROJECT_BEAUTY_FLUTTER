import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Để sử dụng định dạng tiền tệ

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Orders',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyOrdersScreen(),
    );
  }
}

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final List<Map<String, dynamic>> orders = [
    {
      'id': '001',
      'name': 'Sản phẩm A',
      'price': 100000,
      'discount': 10000,
      'status': 'Đang giao',
    },
    {
      'id': '002',
      'name': 'Sản phẩm B',
      'price': 200000,
      'discount': 20000,
      'status': 'Đã giao',
    },
    {
      'id': '003',
      'name': 'Sản phẩm C',
      'price': 150000,
      'discount': 5000,
      'status': 'Đã hủy',
    },
  ];

  String? selectedSection;

  @override
  Widget build(BuildContext context) {
    final inTransitOrders = orders.where((order) => order['status'] == 'Đang giao').toList();
    final completedOrders = orders.where((order) => order['status'] == 'Đã giao').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng của tôi'),
      ),
      body: ListView(
        children: [
          _buildOrderSection('Đang vận chuyển', inTransitOrders),
          _buildOrderSection('Hoàn tất', completedOrders),
        ],
      ),
    );
  }

  Widget _buildOrderSection(String title, List<Map<String, dynamic>> orders) {
    final isSelected = selectedSection == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSection = isSelected ? null : title;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: isSelected ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
          if (isSelected) ...orders.map((order) {
            final discountedPrice = order['price'] - order['discount'];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(order['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mã đơn hàng: ${order['id']} - Trạng thái: ${order['status']}'),
                    Text(
                      'Giá gốc: ${NumberFormat.currency(locale: 'vi', symbol: 'VNĐ').format(order['price'])}',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    Text('Giá giảm: ${NumberFormat.currency(locale: 'vi', symbol: 'VNĐ').format(order['discount'])}'),
                    Text('Giá sau giảm: ${NumberFormat.currency(locale: 'vi', symbol: 'VNĐ').format(discountedPrice)}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                trailing: order['status'] == 'Đang giao'
                    ? ElevatedButton(
                        onPressed: () {
                          // Logic để hoàn tất hoặc hủy đơn hàng
                        },
                        child: Text('Hoàn tất'),
                      )
                    : null,
              ),
            );
          }).toList(),
          if (isSelected && orders.isEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Không có đơn hàng nào', style: TextStyle(color: Colors.grey)),
            ),
        ],
      ),
    );
  }
}
