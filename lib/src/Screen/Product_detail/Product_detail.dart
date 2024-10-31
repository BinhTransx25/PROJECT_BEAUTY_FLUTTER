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
            ProductImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductInfo(),
                  const Divider(color: Color(0xFFE4E7EC)),
                  const SizedBox(height: 5),
                  const Text(
                    'Mô tả',
                    style: TextStyle(color: Color(0xFF95989A), fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Son Velvet Matte Vỏ Trong Suốt Soft Matte Lipstick - Version Deep Under More Deep 3.5',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const Divider(color: Color(0xFFE4E7EC)),
                  ProductReview(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 397,
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Image.asset('lib/src/assets/Account/pro_de.png', width: 120, height: 120),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: Image.asset('lib/src/assets/Account/ArrowLeft.png', width: 24, height: 24),
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
                BoxShadow(color: Colors.black.withOpacity(0.102), blurRadius: 5, offset: Offset(0, 2)),
              ],
            ),
            child: Center(
              child: Image.asset('lib/src/assets/Account/Heart.png', width: 24, height: 24),
            ),
          ),
        ),
      ],
    );
  }
}

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
            const Spacer(),
            QuantitySelector(),
          ],
        ),
      ],
    );
  }
}

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {}, // Giảm số lượng
          icon: const Icon(Icons.remove),
        ),
        const Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        IconButton(
          onPressed: () {}, // Tăng số lượng
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

class ProductReview extends StatelessWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Đánh giá', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ReviewItem();
          },
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Mohamad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
              const Spacer(),
              Row(children: List.generate(5, (index) => const Icon(Icons.star, size: 25, color: Colors.yellow))),
            ],
          ),
          const Text('26-05-2024', style: TextStyle(color: Color(0xFF979797), fontSize: 12)),
          const Text('Tui rất thích', style: TextStyle(color: Colors.black, fontSize: 15)),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFD61355),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              // Hành động khi nhấn nút Thanh toán
            },
            child: const Text('Thanh toán', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
