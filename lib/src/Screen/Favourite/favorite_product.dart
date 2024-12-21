import 'widgets/basic_action_bar.dart';
import '../Find/widgets/favorite_no_item.dart';
import 'widgets/favorite_product_item.dart';
import 'package:flutter/material.dart';
import '../../app/tabs/bottom_nav_bar.dart';


class FavoriteProduct extends StatelessWidget {
  final bool? isNoItem;

  const FavoriteProduct({Key? key, this.isNoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hideItem = isNoItem ?? false;
    return Container(
      color: Color(0xffffffff),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: const BasicActionBar(title: "Sản Phẩm Yêu Thích"),
          body: !hideItem
              ? Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListProducts(items: sampleProducts),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                    ),
                    FavoriteNoItem()
                  ],
                ),
          bottomNavigationBar: const BottomNavBar(
              currentIndex: 1), // Đánh dấu màn hình này là mục đầu tiên
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
            // showPrice: product.showPrice,
            icon: ProductItemIcons.heart

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
    showPrice: true,
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
