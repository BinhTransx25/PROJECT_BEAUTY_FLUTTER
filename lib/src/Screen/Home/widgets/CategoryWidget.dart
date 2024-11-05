import 'package:flutter/material.dart';
import '../../../models/home/data.dart'; // Điều chỉnh đường dẫn tùy thuộc vào vị trí file

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(label: Text(category.name)),
          );
        }).toList(),
      ),
    );
  }
}
