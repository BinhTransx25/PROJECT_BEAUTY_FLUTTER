import 'package:flutter/material.dart';

class Outstandingproduct {
  final String imageUrl;
  final String name;
  final double originalprice;
  final double discountedprice;

  Outstandingproduct({
    required this.imageUrl,
    required this.name,
    required this.originalprice,
    required this.discountedprice,
  });
}

List<Outstandingproduct> outstandingproduct = [
  Outstandingproduct(
    imageUrl: 'lib/src/assets/Home/sp1.png',
    name: 'Son LOreal',
    originalprice: 15000,
    discountedprice: 12000,
  ),
  Outstandingproduct(
    imageUrl: 'lib/src/assets/Home/sp2.png',
    name: 'Serum LOreal',
    originalprice: 25000,
    discountedprice: 20000,
  ),
  Outstandingproduct(
    imageUrl: 'lib/src/assets/Home/sp3.png',
    name: 'Mực LOreal',
    originalprice: 30000,
    discountedprice: 25000,
  ),
  Outstandingproduct(
    imageUrl: 'lib/src/assets/Home/sp4.png',
    name: 'Phấn LOreal',
    originalprice: 30000,
    discountedprice: 25000,
  ),
];

class OutstandingProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return outstandingproduct.isNotEmpty
        ? Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: outstandingproduct.map((product) {
              return SizedBox(
                width: 168,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
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
                          width: 168,
                          height: 178,
                          fit: BoxFit.cover,
                        ),
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
                              text: '${product.originalprice} đ ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' ${product.discountedprice} đ',
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
                ),
              );
            }).toList(),
          )
        : Center(child: Text('No outstanding products available'));
  }
}
