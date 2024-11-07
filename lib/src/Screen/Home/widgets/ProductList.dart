import 'package:flutter/material.dart';
import '../../../models/home/data_demo.dart'; // Import dữ liệu sản phẩm mẫu nếu cần

class ProductList extends StatelessWidget {
  final List<OutstandingProduct> outstandingproduct;

  const ProductList({required this.outstandingproduct});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sản phẩm nổi bật",
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Text(
                  "Tất cả",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(Icons.arrow_circle_right,
                    size: 30, color: Color(0xffD61355)),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 230,
          child: outstandingproduct.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: outstandingproduct.length,
                  itemBuilder: (context, index) {
                    final product = outstandingproduct[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000).withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  product.imageUrl,
                                  width: 150,
                                  height: 171,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 7),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'lib/src/assets/Home/Rectangle.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 0),
                                    child: Icon(Icons.add,
                                        size: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${product.originalPrice} đ ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${product.discountedPrice} đ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFD61355),
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Color(0xFFD61355),
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text('No outstanding products available'),
                ),
        ),
      ],
    );
  }
}
