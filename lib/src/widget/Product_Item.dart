import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String price;
  final String oldPrice;
  final String imageUrl;

  const ProductItem({
    Key? key,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 179,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.102), // 10.2% đổ bóng
            blurRadius: 10,
            offset: Offset(0, 2), // thay đổi vị trí bóng
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10), // Padding cho cái image
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    width: 155,
                    height: 171,
                    fit: BoxFit.cover,
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
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8), // Khoảng cách giữa hình và product name
            Text(
              productName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 4), // Khoảng cách giữa product name và price
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                SizedBox(width: 8), // Khoảng cách giữa giá cũ và giá mới
                Text(
                  oldPrice,
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFFD61355), 
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/**
Cách sài:
import 'path_to_your_file/product_item.dart';

và gọi nó ga như lầy:

  ProductItem(
  productName: 'Tên Sản Phẩm',
  price: '150.000 đ',
  oldPrice: '210.000 đ',
  imageUrl: 'https://example.com/image.jpg',

);

 */


