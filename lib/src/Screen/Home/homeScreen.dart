import 'package:flutter/material.dart';
import 'widgets/promotion_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/outstanding_product_widget.dart';
import 'widgets/promotional_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PromotionalBannerWidget(),
            SizedBox(height: 15),
            PromotionWidget(),
            SizedBox(height: 15),
            CategoryWidget(),
            SizedBox(height: 15),
            OutstandingProductWidget(),
          ],
        ),
      ),
    );
  }
}
