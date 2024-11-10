import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFD61355),
        ),
        onPressed: () {
          context.go('/ongoing');
        },
        child: Text(
          "Đặt hàng",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
