import 'package:flutter/material.dart';
import '../../../models/home/data_home_new.dart';

class PromotionList extends StatelessWidget {
  final List<Promotion> promotions;

  const PromotionList({Key? key, required this.promotions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: promotions.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: promotions.length,
              itemBuilder: (context, index) {
                final promotion = promotions[index];
                return SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'lib/src/assets/Home/Ellipse.png', // Hình nền ellipse
                            width: 60,
                            height: 60,
                          ),
                          ClipOval(
                            child: Image.asset(
                              promotion.imageUrl,
                              width: 35, // Đảm bảo kích thước vừa khung
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        promotion.name,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(child: Text('No promotions available')),
    );
  }
}
