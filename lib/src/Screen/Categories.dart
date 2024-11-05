import 'package:flutter/material.dart';

void main() {
  runApp(Categories());
}

class Categories extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Son L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/anh6.png',
    ),
    Product(
      name: 'Serum L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/anh7.png',
    ),
    Product(
      name: 'Mực L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/anh8.png',
    ),
    Product(
      name: 'Phấn L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/anh9.png',
    ),
    Product(
      name: 'Son L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/anh6.png',
    ),
    Product(
      name: 'Serum L\'Oreal',
      price: 150000,
      oldPrice: 160000,
      imageUrl: 'lib/src/assets/anh7.png',
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
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
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
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
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
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${product.price}₫',
                      style: TextStyle(fontSize: 14, color: Color(0xFFD61355)),
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
