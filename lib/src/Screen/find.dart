import 'package:beauty/src/widget/favorite_product_item.dart';
import 'package:beauty/src/widget/label.dart';
import 'package:beauty/src/widget/search_suggestion.dart';
import 'package:beauty/src/widget/search_action_bar.dart';

import 'package:flutter/material.dart';

final List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const SearchActionBar(filterSuccessful: true,),
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
                SearchSuggestion(
                  text: "Son dưỡng ẩm",
                  showIcon: true,
                ),
                SearchSuggestion(
                  text: "Tẩy trang",
                  showIcon: false,
                ),
                SearchSuggestion(
                  text: "kẻ mắt",
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

                ListProducts(items: items)
              ],
            )));
  }
}

// class ListSearchSuggestions extends StatelessWidget { // Đang lỗi render
//   final List<Map<String, dynamic>> suggestions = [
//     {"text": "Son dưỡng ẩm", "showIcon": true},
//     {"text": "Tẩy trang", "showIcon": false},
//     {"text": "kẻ mắt", "showIcon": false},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final suggestion = suggestions[index];
//         return SearchSuggestion(
//           text: suggestion["text"],
//           showIcon: suggestion["showIcon"],
//         );
//       },
//     );
//   }
// }

class ListProducts extends StatelessWidget {
  final List<int> items;

  const ListProducts({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Chia đôi màn hình
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 5 / 7, // Điều chỉnh tỷ lệ nếu cần
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FavoriteProductItem(
          productName: "productName",
          price: "64000",
          oldPrice: "40000",
          imageUrl: "imageUrl",
          showPrice: false,
        );
      },
    ));
  }
}
