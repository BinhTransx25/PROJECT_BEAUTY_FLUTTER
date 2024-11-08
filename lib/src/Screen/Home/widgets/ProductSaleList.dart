import 'package:flutter/material.dart';
import '../../../models/home/data_home_new.dart';


class ProductSaleList extends StatelessWidget {
  final List<OutstandingProductSale> products;
  final String title;

  const ProductSaleList({required this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Flash Sale",
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
          child: products.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000)
                                          .withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    product.imageUrl,
                                    width: 150,
                                    height: 171,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (product.sale != '')
                                Positioned(
                                  top: -7,
                                  left: 2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          'lib/src/assets/Home/discount.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Text(
                                        product.sale,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Positioned(
                                top: 7,
                                right: 7,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        'lib/src/assets/Home/Rectangle.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      child: Icon(Icons.add,
                                          size: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
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
