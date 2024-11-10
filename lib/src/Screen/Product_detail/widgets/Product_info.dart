import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tên Sản Phẩm',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('150.000 đ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
            Text(
              '210.000 đ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFFD61355),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Row(children: List.generate(5, (index) => const Icon(Icons.star, size: 20, color: Colors.yellow))),
            const SizedBox(width: 8),
            const Text('4.5/5', style: TextStyle(fontSize: 15, color: Colors.black)),
            const SizedBox(width: 8),
            Text('(2.346)', style: TextStyle(fontSize: 15, color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }
}
