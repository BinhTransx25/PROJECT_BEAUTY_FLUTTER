import 'package:flutter/material.dart';
import '../../../models/home/data.dart'; // Điều chỉnh đường dẫn tùy thuộc vào vị trí file

class OutstandingProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: outstandingproduct.map((product) {
        return Card(
          child: ListTile(
            leading: Image.asset(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Giá gốc: ${product.originalprice} VND"),
                Text("Giá giảm: ${product.discountedprice} VND"),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
