import 'package:flutter/material.dart';

class AddAddressButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddAddressButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            '+ Thêm Địa Chỉ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
    );
  }
}
