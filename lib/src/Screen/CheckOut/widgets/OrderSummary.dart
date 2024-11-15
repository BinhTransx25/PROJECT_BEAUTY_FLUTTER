import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tóm tắt đơn hàng',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền hàng',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 135, 135, 135),
                  )),
              Text('150.000 đ', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền phí vận chuyển',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 135, 135, 135),
                  )),
              Text('15.000 đ', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Phiếu giảm giá',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 135, 135, 135),
                  )),
              Text('-15.000 đ', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng thanh toán',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('150.000 đ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD61355),
                )),
          ],
        ),
      ],
    );
  }
}
