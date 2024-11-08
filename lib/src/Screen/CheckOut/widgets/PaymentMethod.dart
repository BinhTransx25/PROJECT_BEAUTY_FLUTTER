import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phương thức thanh toán',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                // Xử lý sự kiện thay đổi ở đây
                print('Thay đổi phương thức thanh toán');
              },
              child: Text(
                'Thay đổi',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey, // Màu bạc
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/src/assets/Checkout/location.png',
              height: 40,
              width: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Thanh toán khi nhận hàng',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
