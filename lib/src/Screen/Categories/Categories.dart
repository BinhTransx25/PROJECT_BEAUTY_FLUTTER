import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Son L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/Category/anh6.png',
    ),
    Product(
      name: 'Serum L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/Category/anh7.png',
    ),
    Product(
      name: 'Mực L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/Category/anh8.png',
    ),
    Product(
      name: 'Phấn L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/Category/anh9.png',
    ),
    Product(
      name: 'Son L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/Category/anh6.png',
    ),
    Product(
      name: 'Serum L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/Category/anh7.png',
    ),
    // Thêm sản phẩm khác nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Trang Điểm Môi'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            TabBarSection(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.pink,
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'Gợi ý'),
              Tab(text: 'Bán chạy'),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      '${product.price}₫',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFD61355),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${product.oldPrice}₫',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  final int oldPrice;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
  });
}
