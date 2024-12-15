import 'widgets/favorite_product_item.dart';
import 'widgets/label.dart';
import 'widgets/search_suggestion.dart';
import 'widgets/search_action_bar.dart';

import 'package:flutter/material.dart';

// final List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const SearchActionBar(
          filterSuccessful: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Label(
                  title: "Gần đây và phổ biến",
                  showRightIcon: true,
                ),
                // SizedBox(height: 5,),
                // SearchSuggestion(
                //   text: "Son dưỡng ẩm",
                //   showIcon: true,
                // ),
                // SearchSuggestion(
                //   text: "Tẩy trang",
                //   showIcon: false,
                // ),
                // SearchSuggestion(
                //   text: "kẻ mắt",
                // ),
                ListSearchSuggestions(
                  suggestions: sampleSuggestions,
                ),

                SizedBox(
                  height: 20,
                ),

                Label(
                  title: "Đề xuất",
                ),

                SizedBox(
                  height: 15,
                ),

                ListProducts(items: sampleProducts)
              ],
            )));
  }
}

class ListSearchSuggestions extends StatelessWidget {
  final List<SearchSuggestionModel> suggestions;
  final double maxHeight; // Thêm chiều cao tối đa

  const ListSearchSuggestions({
    super.key,
    required this.suggestions,
    this.maxHeight = 150.0, // Giá trị mặc định
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxHeight, // Đặt chiều cao tối đa cho danh sách
      child: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return SearchSuggestion(
            text: suggestion.text,
          );
        },
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

class SearchSuggestionModel {
  final String text;

  SearchSuggestionModel({required this.text});
}

final List<SearchSuggestionModel> sampleSuggestions = [
  SearchSuggestionModel(text: "kẻ mắt"),
  SearchSuggestionModel(text: "son môi"),
  SearchSuggestionModel(text: "phấn nền"),
  SearchSuggestionModel(text: "kem dưỡng da"),
  SearchSuggestionModel(text: "tẩy trang"),
];
