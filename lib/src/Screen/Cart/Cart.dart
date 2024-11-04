import 'package:flutter/material.dart';
import 'widgets/empty_cart.dart';
import 'widgets/product_list.dart';
import 'widgets/cart_app_bar.dart';
import 'widgets/bottom_bar.dart';

class CartScreen extends StatelessWidget {
  final List<Product> products = []; // Có thể để rỗng để kiểm tra giao diện giỏ hàng trống.

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(),
      body: products.isEmpty ? EmptyCart() : ProductList(products: products),
      bottomNavigationBar: products.isNotEmpty ? BottomBar() : null,
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
