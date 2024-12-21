import 'widgets/empty_filter.dart';
import 'widgets/favorite_product_item.dart';
import 'widgets/search_action_bar.dart';
import 'package:flutter/material.dart';


class Finding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const SearchActionBar(filterSuccessful: true,),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: const TabBar(
                labelColor: Color(0xffD61355),
                unselectedLabelColor: Colors.black,
                indicatorColor: Color(0xffD61355),
                labelStyle: TextStyle(fontSize: 17),
                tabs: [
                  Tab(text: "Gợi ý"),
                  Tab(text: "Mới nhất"),
                  Tab(text: "Bán chạy"),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TabBarView(
                  children: [
                    Center(child: ListProducts(items: sampleProducts)),
                    // Center(child: Text("Nội dung Mới nhất")),
                    Column(
                      children: [
                        SizedBox(
                          height: 120,
                        ),
                        EmptyFilter()
                      ],
                    ),
                    Center(child: Text("Nội dung Bán chạy")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  final List<Product> items;

  const ListProducts({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Chia đôi màn hình
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 5 / 7, // Điều chỉnh tỷ lệ nếu cần
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final product = items[index];
          return FavoriteProductItem(
            productName: product.productName,
            price: product.price,
            oldPrice: product.oldPrice,
            imageUrl: product.imageUrl,
            showPrice: product.showPrice,
          );
        },
      ),
    );
  }
}

class Product {
  final String productName;
  final String price;
  final String oldPrice;
  final String imageUrl;
  final bool showPrice;

  Product({
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
    this.showPrice = true,
  });
}

final List<Product> sampleProducts = [
  Product(
    productName: "Product 1",
    price: "64,000",
    oldPrice: "80,000",
    imageUrl: "https://example.com/image1.png",
    showPrice: true,
  ),
  Product(
    productName: "Product 2",
    price: "54,000",
    oldPrice: "70,000",
    imageUrl: "https://example.com/image2.png",
    showPrice: false,
  ),
  Product(
    productName: "Product 3",
    price: "74,000",
    oldPrice: "90,000",
    imageUrl: "https://example.com/image3.png",
    showPrice: true,
  ),
  Product(
    productName: "Product 4",
    price: "84,000",
    oldPrice: "100,000",
    imageUrl: "https://example.com/image4.png",
    showPrice: true,
  ),
];