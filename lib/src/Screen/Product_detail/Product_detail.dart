import 'package:flutter/material.dart';
import 'widgets/Product_image.dart';
import 'widgets/Product_info.dart';
import 'widgets/Product_review.dart';
import 'widgets/bottom_bar.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfo(),
                  Divider(color: Color(0xFFE4E7EC)),
                  SizedBox(height: 5),
                  Text(
                    'Mô tả',
                    style: TextStyle(color: Color(0xFF95989A), fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Son Velvet Matte Vỏ Trong Suốt Soft Matte Lipstick - Version Deep Under More Deep 3.5',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Divider(color: Color(0xFFE4E7EC)),
                  ProductReview(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
