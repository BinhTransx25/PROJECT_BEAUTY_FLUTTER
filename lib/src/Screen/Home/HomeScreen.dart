import 'dart:async';
import '../../models/home/data_home_new.dart';
import 'package:flutter/material.dart';
import 'widgets/header.dart';
import 'widgets/PromotionList.dart';
import 'widgets/CategoryList .dart';
import 'widgets/ProductList.dart';
import 'widgets/ProductSaleList.dart';
import 'widgets/RadiantGlowSection.dart';

class HomeScreen extends StatefulWidget {
  final int notificationCount;
  const HomeScreen({this.notificationCount = 1, Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22),
              Header(notificationCount: 5),
              SizedBox(height: 20),
              Carousel(
                  images: carouselImages,
                  pageController: _pageController,
                  onPageChanged: _onPageChanged),
              SizedBox(height: 20),
              PromotionList(promotions: promotions),
              SizedBox(height: 20),
              CategoryList(categories: categories),
              SizedBox(height: 20),
              ProductList(outstandingproduct: outstandingProducts),
              SizedBox(height: 20),
              ProductSaleList(
                  products: outstandingProductSales,
                  title: "Sản phẩm khuyến mãi"),
              SizedBox(height: 20),
              RadiantGlowSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// Header widget
// class Header extends StatelessWidget {
//   final int notificationCount;
//   const Header({required this.notificationCount});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Địa chỉ giao hàng",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             Text("Số 123, Phường 12, Quận 1",
//                 style: TextStyle(color: Colors.grey[600])),
//           ],
//         ),
//         Icon(Icons.notifications, color: Colors.grey, size: 30),
//       ],
//     );
//   }
// }

// Carousel widget
class Carousel extends StatelessWidget {
  final List<String> images;
  final PageController pageController;
  final Function(int) onPageChanged;

  const Carousel(
      {required this.images,
      required this.pageController,
      required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(images[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}

// PromotionList widget
// class PromotionList extends StatelessWidget {
//   final List<Promotion> promotions;

//   const PromotionList({required this.promotions});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: promotions
//           .map((promo) => Column(
//                 children: [
//                   Image.asset(promo.imageUrl, width: 50, height: 50),
//                   Text(promo.name, textAlign: TextAlign.center),
//                 ],
//               ))
//           .toList(),
//     );
//   }
// }

// CategoryList widget
// class CategoryList extends StatelessWidget {
//   final List<Category> categories;

//   const CategoryList({required this.categories});

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 10,
//       runSpacing: 10,
//       children: categories
//           .map((category) => Chip(label: Text(category.name)))
//           .toList(),
//     );
//   }
// }

// ProductList widget for Outstanding Products
// class ProductList extends StatelessWidget {
//   final List<OutstandingProduct> products;
//   final String title;

//   const ProductList({required this.products, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: products
//                 .map((product) => ProductCard(product: product))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Product Card for Displaying a Product
// class ProductCard extends StatelessWidget {
//   final OutstandingProduct product;

//   const ProductCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 10),
//       width: 120,
//       child: Column(
//         children: [
//           Image.asset(product.imageUrl, height: 120),
//           Text(product.name),
//           Text("\$${product.originalPrice}",
//               style: TextStyle(decoration: TextDecoration.lineThrough)),
//           Text("\$${product.discountedPrice}",
//               style: TextStyle(color: Colors.red)),
//         ],
//       ),
//     );
//   }
// }

// ProductSaleList widget for Outstanding Products with Sale
// class ProductSaleList extends StatelessWidget {
//   final List<OutstandingProductSale> products;
//   final String title;

//   const ProductSaleList({required this.products, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         SizedBox(height: 10),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: products
//                 .map((product) => ProductSaleCard(product: product))
//                 .toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ProductSaleCard widget for Products with Sale
// class ProductSaleCard extends StatelessWidget {
//   final OutstandingProductSale product;

//   const ProductSaleCard({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 10),
//       width: 120,
//       child: Column(
//         children: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               Image.asset(product.imageUrl, height: 120),
//               if (product.sale.isNotEmpty)
//                 Container(
//                   padding: EdgeInsets.all(4),
//                   color: Colors.red,
//                   child: Text(product.sale,
//                       style: TextStyle(color: Colors.white, fontSize: 12)),
//                 ),
//             ],
//           ),
//           Text(product.name),
//           Text("\$${product.originalPrice}",
//               style: TextStyle(decoration: TextDecoration.lineThrough)),
//           Text("\$${product.discountedPrice}",
//               style: TextStyle(color: Colors.red)),
//         ],
//       ),
//     );
//   }
// }
