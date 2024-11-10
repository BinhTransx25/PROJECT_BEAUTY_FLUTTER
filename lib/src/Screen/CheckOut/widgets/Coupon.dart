import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class Coupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phiếu giảm giá',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                context.go('/voucher');
                // Xử lý sự kiện thay đổi ở đây
                print('Thay đổi phiếu giảm giá');
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phiếu giảm giá của shop',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      // Xử lý sự kiện chọn phiếu giảm giá
                      print('Chọn phiếu giảm giá');
                    },
                    child: Text(
                      'Chọn phiếu giảm giá',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey, // Màu bạc
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
