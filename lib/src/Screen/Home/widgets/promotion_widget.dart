import 'package:flutter/material.dart';

class Promotion {
  final String imageUrl;
  final String name;

  Promotion({required this.imageUrl, required this.name});
}

List<Promotion> promotions = [
  Promotion(imageUrl: 'lib/src/assets/Home/coupon.png', name: 'Mã giảm giá'),
  Promotion(imageUrl: 'lib/src/assets/Home/donation.png', name: 'Ưu đãi \n combo'),
  Promotion(imageUrl: 'lib/src/assets/Home/refund.png', name: 'Hoàn tiền'),
  Promotion(imageUrl: 'lib/src/assets/Home/freeshipping.png', name: 'Free ship'),
];

class PromotionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // Set a height for the promotion widget
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          final promotion = promotions[index];
          return Card(
            child: Column(
              children: [
                Image.asset(promotion.imageUrl, width: 80, height: 80),
                Text(promotion.name, textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }
}
