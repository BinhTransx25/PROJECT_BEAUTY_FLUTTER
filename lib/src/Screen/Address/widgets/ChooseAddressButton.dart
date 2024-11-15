import 'package:flutter/material.dart';

class ChooseAddressButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ChooseAddressButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 60,
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'Lựa Chọn',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
      ),
    );
  }
}
