import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Địa chỉ giao hàng',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
                context.go('/address');
            // Thực hiện hành động khi nhấn vào phần này
            print("Địa chỉ được nhấn!");
            // Bạn có thể thay thế hành động trên bằng điều hướng đến màn hình khác:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/src/assets/Checkout/location.png',
                height: 40,
                width: 40,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nhà riêng',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Địa chỉ',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
