import 'package:flutter/material.dart';

class Category {
  final String name;
  Category({required this.name});
}

List<Category> categories = [
  Category(name: 'Son'),
  Category(name: 'Tẩy trang'),
  Category(name: 'Dưỡng ẩm'),
  Category(name: 'Mặt nạ bùn'),
  Category(name: 'Lột mụn'),
];

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // Set a height for the category widget
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              label: Text(category.name),
            ),
          );
        },
      ),
    );
  }
}
