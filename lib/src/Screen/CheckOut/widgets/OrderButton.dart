import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        onPressed: () {},
        child: Text(
          "Đặt hàng",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
