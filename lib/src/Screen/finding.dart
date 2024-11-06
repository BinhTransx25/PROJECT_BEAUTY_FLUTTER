import 'package:beauty/src/widget/empty_filter.dart';
import 'package:beauty/src/widget/favorite_product_item.dart';
import 'package:beauty/src/widget/search_action_bar.dart';
import 'package:flutter/material.dart';

final List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

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
                    Center(child: ListProducts(items: items)),
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
        );
      },
    ));
  }
}
