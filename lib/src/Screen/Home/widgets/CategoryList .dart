import 'package:beauty/src/service/Home/CategoryService.dart';
import 'package:flutter/material.dart';
import '../../../models/home/CategoryModel.dart'; 


class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryService _categoryService = CategoryService();
  List<CategoryModel> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final fetchedCategories = await _categoryService.getCategories();
      setState(() {
        categories = fetchedCategories.take(5).toList(); // giới hạn 
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Danh mục sản phẩm",
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        isLoading 
            ? const Center(child: CircularProgressIndicator())
            : categories.isNotEmpty
                ? Wrap(
                    spacing: 8,
                    runSpacing: 15,
                    children: List.generate(categories.length, (index) {
                      final category = categories[index];
                      return IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 214, 214),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              category.name,
                              style: const TextStyle(
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
                : const Center(child: Text("No categories available"))
      ],
    );
  }
}