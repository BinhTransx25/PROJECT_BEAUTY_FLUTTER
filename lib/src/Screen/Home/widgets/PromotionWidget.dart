import 'package:flutter/material.dart';
import '../../../models/home/data.dart'; // Điều chỉnh đường dẫn tùy thuộc vào vị trí file

class PromotionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: promotions.map((promotion) {
          return Column(
            children: [
              Image.asset(promotion.imageUrl, width: 50, height: 50),
              Text(promotion.name, textAlign: TextAlign.center),
            ],
          );
        }).toList(),
      ),
    );
  }
}
