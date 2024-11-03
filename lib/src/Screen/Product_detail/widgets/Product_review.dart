import 'package:flutter/material.dart';

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
            return const ReviewItem();
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
