import 'package:flutter/material.dart';
import 'widgets/PromotionWidget.dart';
import 'widgets/CategoryWidget.dart';
import 'widgets/OutstandingProductWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PromotionWidget(),
            SizedBox(height: 16),
            CategoryWidget(),
            SizedBox(height: 16),
            OutstandingProductWidget(),
          ],
        ),
      ),
    );
  }
}
