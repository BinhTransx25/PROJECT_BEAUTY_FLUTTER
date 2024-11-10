import 'package:flutter/material.dart';
import 'widgets/empty_cart.dart';
import 'widgets/product_list.dart';
import 'widgets/cart_app_bar.dart';
import 'widgets/bottom_bar.dart';
import '../../app/tabs/bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  final List<Product> products =
      []; // Có thể để rỗng để kiểm tra giao diện giỏ hàng trống.

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CartAppBar(),
      body: products.isEmpty ? EmptyCart() : ProductList(products: products),
      bottomSheet: products.isNotEmpty ? BottomBar() : null,
      bottomNavigationBar: const BottomNavBar(
              currentIndex: 3), // Đánh dấu màn hình này là mục đầu tiên
    );
  }
}

class Product {
  final String name;
  final int price;
  final int sale;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.sale,
    required this.imageUrl,
  });
}
