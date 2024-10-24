import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 397,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: Image.network(
                    'https://example.com/image.jpg', // Thay bằng URL hình ảnh sản phẩm
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Image.network(
                    'https://example.com/back_arrow.png', // Thay bằng URL hình mũi tên
                    width: 30,
                    height: 30,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.102), // 10.2% opacity
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.network(
                        'https://example.com/heart.png', // Thay bằng URL hình trái tim
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Thông tin sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên Sản Phẩm',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '150.000 đ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
                      ),
                      Text(
                        '210.000 đ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFFD61355), // Màu D61355
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(Icons.star, size: 10, color: Colors.yellow);
                        }),
                      ),
                      SizedBox(width: 8),
                      Text('4.5/5', style: TextStyle(fontSize: 15, color: Colors.black)),
                      SizedBox(width: 8),
                      Text('(2.346)', style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                      Spacer(),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Center(child: Text('-', style: TextStyle(fontSize: 18))),
                      ),
                      SizedBox(width: 4),
                      Text('1', style: TextStyle(fontSize: 15)),
                      SizedBox(width: 4),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Center(child: Text('+', style: TextStyle(fontSize: 18))),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xFFE4E7EC)), // Thanh ngang
                  SizedBox(height: 5),
                  Text('Mô tả', style: TextStyle(color: Color(0xFF95989A), fontSize: 15)),
                  SizedBox(height: 4),
                  Text(
                    'Son Velvet Matte Vỏ Trong Suốt Soft Matte Lipstick – Version Deep Under More Deep 3.5',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Divider(color: Color(0xFFE4E7EC)), // Thanh ngang
                  SizedBox(height: 5),
                  Text('Đánh giá', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // Ngăn cuộn bên trong
                    itemCount: 5, // Số lượng đánh giá
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Mohamad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                                Spacer(),
                                Row(
                                  children: List.generate(5, (index) {
                                    return Icon(Icons.star, size: 10, color: Colors.yellow);
                                  }),
                                ),
                              ],
                            ),
                            Text('26-05-2024', style: TextStyle(color: Color(0xFF979797), fontSize: 9)),
                            Text('tui rất thích', style: TextStyle(color: Colors.black, fontSize: 15)),
                            Text('hiện thêm', style: TextStyle(color: Color(0xFFEFE2E2))),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(color: Color(0xFFE4E7EC)), // Thanh ngang
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 103,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('150.000 đ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                Text(
                  '210.000 đ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFFD61355),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD61355)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('-', style: TextStyle(fontSize: 22))),
                ),
                SizedBox(width: 8),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD61355)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('+', style: TextStyle(fontSize: 22))),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD61355), // Màu D61355
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                shadowColor: Colors.black.withOpacity(0.102), // Đổ bóng
              ),
              onPressed: () {
                // Hành động khi nhấn nút Thanh toán
              },
              child: Text('Thanh toán', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
