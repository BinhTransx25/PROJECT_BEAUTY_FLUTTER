import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ProductItemIcons { add, heart }

class FavoriteProductItem extends StatelessWidget {
  final String productName;
  final String? price;
  final String? oldPrice;
  final String imageUrl;

  final bool? showPrice;
  final ProductItemIcons? icon;

  const FavoriteProductItem({
    Key? key,
    required this.productName,
    this.price,
    this.oldPrice,
    required this.imageUrl,
    this.showPrice,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPriceVisible = showPrice ?? true;
    final CrossAxisAlignment productNameAlign =
        isPriceVisible ? CrossAxisAlignment.start : CrossAxisAlignment.center;

    final String displayPrice = price ?? 'N/A';
    final String displayOldPrice = oldPrice ?? 'N/A';

    final ProductItemIcons displayIcon = icon ?? ProductItemIcons.add;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: productNameAlign,
          children: [
            ImageBox(
              icon: displayIcon,
            ),

            SizedBox(height: 8), // Khoảng cách giữa hình và product name

            Text(
              productName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),

            SizedBox(height: 4), // Khoảng cách giữa product name và price

            if (isPriceVisible)
              PriceBox(price: displayPrice, oldPrice: displayOldPrice)
          ],
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  final ProductItemIcons icon;

  const ImageBox({super.key, required this.icon});

  Widget iconWidget(ProductItemIcons icon) {
    switch (icon) {
      case ProductItemIcons.heart:
        return SvgPicture.asset(
          SvgIconPaths.heart_fill,
          width: 15,
          height: 15,
        );
      case ProductItemIcons.add:
        return Icon(Icons.add);
      default:
        return Icon(Icons.add);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.112), // 11.2% đổ bóng
            blurRadius: 10,
            offset: Offset(0, 0), // thay đổi vị trí bóng
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "lib/src/assets/product_img_demo/116.png",
              width: 155,
              height: 171,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.102),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(child: iconWidget(icon)),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceBox extends StatelessWidget {
  final String price;
  final String oldPrice;

  const PriceBox({super.key, required this.price, required this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          price,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
        ),
        SizedBox(width: 8), // Khoảng cách giữa giá cũ và giá mới
        Text(
          oldPrice,
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFFD61355),
            decoration: TextDecoration.lineThrough,
            decorationColor: Color(0xFFD61355),
          ),
        ),
      ],
    );
  }
}


// @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: FractionallySizedBox(
//         widthFactor: 1.0, // Chiếm 100% chiều rộng của widget cha
//         child: Row(
//           children: [
//             Text(
//               price,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
//             ),
//             SizedBox(width: 8), // Khoảng cách giữa giá cũ và giá mới
//             Text(
//               oldPrice,
//               style: TextStyle(
//                 fontSize: 10,
//                 color: Color(0xFFD61355),
//                 decoration: TextDecoration.lineThrough,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );