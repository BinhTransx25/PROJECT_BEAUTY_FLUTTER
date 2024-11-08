import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 397,
          child: Image.asset('lib/src/assets/Account/pro_de.png',
              width: 120, height: 120),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: Image.asset('lib/src/assets/Account/ArrowLeft.png',
              width: 24, height: 24),
        ),
        Positioned(
          top: 50,
          right: 50,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.102),
                    blurRadius: 5,
                    offset: Offset(0, 2)),
              ],
            ),
            child: Center(
              child: Image.asset('lib/src/assets/Account/Heart.png',
                  width: 24, height: 24),
            ),
          ),
        ),
      ],
    );
  }
}
