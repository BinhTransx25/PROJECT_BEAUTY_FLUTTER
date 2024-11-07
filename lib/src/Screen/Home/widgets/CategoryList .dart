import 'package:flutter/material.dart';
import '../../../models/home/data_demo.dart'; // Import nếu cần thiết

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Danh mục sản phẩm",
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        categories.isNotEmpty
            ? Wrap(
                spacing: 8,
                runSpacing: 15,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  return IntrinsicWidth(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 214, 214, 214),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              )
            : Center(child: Text("No categories available")),
      ],
    );
  }
}
