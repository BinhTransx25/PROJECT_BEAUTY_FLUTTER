import 'widgets/basic_action_bar.dart';
import '../Find/widgets/favorite_no_item.dart';
import 'widgets/favorite_product_item.dart';
import 'package:flutter/material.dart';

final List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

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
                  child: ListProduct(items: items),
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
        ),
      ),
    );
  }
}


class ListProduct extends StatelessWidget {
  final List<int> items;

  const ListProduct({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Chia đôi màn hình
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 5/7, // Điều chỉnh tỷ lệ nếu cần
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FavoriteProductItem(
            productName: "productName",
            price: "64000",
            oldPrice: "40000",
            imageUrl: "imageUrl",
            icon: ProductItemIcons.heart);
      },
    ));
  }
}
