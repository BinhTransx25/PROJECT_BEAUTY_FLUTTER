import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tóm tắt đơn hàng',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng tiền hàng', style: TextStyle(fontSize: 14)),
            Text('150.000đ', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng tiền phí vận chuyển', style: TextStyle(fontSize: 14)),
            Text('15.000đ', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phiếu giảm giá', style: TextStyle(fontSize: 14)),
            Text('-15.000đ', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng thanh toán', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('150.000đ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
          ],
        ),
      ],
    );
  }
}
