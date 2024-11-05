import 'dart:async';
import '../../models//home//data.dart';
import 'package:flutter/material.dart';

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

  final List<String> images = [
    'lib/src/assets/anh1.png',
    'lib/src/assets/anh2.png',
    'lib/src/assets/anh3.png',
    'lib/src/assets/anh4.png',
    'lib/src/assets/anh5.png',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < images.length - 1) {
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
        // Thay thế Column bằng SingleChildScrollView
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Địa chỉ",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Phê la-Hồng Bàng",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      if (widget.notificationCount > 0)
                        Positioned(
                          left: 20,
                          bottom: 20,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF95989A),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${widget.notificationCount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/src/assets/Ellipse.png',
                        width: 60,
                        height: 60,
                      ),
                      ClipOval(
                        child: Image.asset(
                          'lib/src/assets/avatar.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Color(0xFFD6D6D6)),
                        ),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm sản phẩm',
                            hintStyle: TextStyle(
                              color: Color(0xFF878787),
                              fontSize: 14,
                            ),
                            prefixIcon:
                                Icon(Icons.search, color: Color(0xFF878787)),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Chào',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' Anthony',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD61355),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentPage = index;
                      });
                      _pageController.jumpToPage(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.pink : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 15),
              Text(
                "Danh mục khuyến mãi",
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: promotions.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: promotions.length,
                        itemBuilder: (context, index) {
                          final promotion = promotions[index];
                          return SizedBox(
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'lib/src/assets/Ellipse.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                    ClipOval(
                                      child: Image.asset(
                                        promotion.imageUrl,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  promotion.name,
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(child: Text('No promotions available')),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Danh mục sản phẩm",
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  categories.isNotEmpty
                      ? Wrap(
                          spacing: 8,
                          runSpacing: 15,
                          children: List.generate(categories.length, (index) {
                            final categorie = categories[index];
                            return IntrinsicWidth(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                height: 48,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 214, 214, 214),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    categorie.name,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }))
                      : Center(child: Text("No categories available")),
                ],
              ),


              Divider(height: 15, color: Colors.transparent),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sản phẩm nổi bật",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Tất cả",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.arrow_circle_right,
                              size: 30, color: Color(0xffD61355)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 230,
                    child: outstandingproduct.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: outstandingproduct.length,
                            itemBuilder: (context, index) {
                              final product = outstandingproduct[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF000000)
                                                    .withOpacity(0.1),
                                                spreadRadius: 0,
                                                blurRadius: 10,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            product.imageUrl,
                                            width: 150,
                                            height: 171,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 7),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'lib/src/assets/Rectangle.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 0),
                                              child: Icon(Icons.add,
                                                  size: 16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${product.originalprice} đ ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ${product.discountedprice} đ',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFD61355),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  Color(0xFFD61355),
                                              decorationThickness: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text('No outstanding products available'),
                          ),
                  ),
                ],
              ),


              Container(
                width: double.infinity,
                height: 162,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(
                    color: Color(0xffD0D5DD),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      child: Center(
                        child: Text(
                          'Radiant Glow',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                          ),
                          child: Image.asset(
                            'lib/src/assets/frame.png',
                            width: 87,
                            height: 136,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          child: Image.asset(
                            'lib/src/assets/frame1.png',
                            width: 87,
                            height: 136,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          child: Image.asset(
                            'lib/src/assets/frame2.png',
                            width: 87,
                            height: 136,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            'lib/src/assets/frame3.png',
                            width: 87,
                            height: 136,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Divider(height: 15, color: Colors.transparent),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sản phẩm mới",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Tất cả",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.arrow_circle_right,
                              size: 30, color: Color(0xffD61355)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  outstandingproduct.isNotEmpty
                      ? Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: outstandingproduct.map((product) {
                            return SizedBox(
                              width: 168,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0xFF000000)
                                                    .withOpacity(0.1),
                                                spreadRadius: 0,
                                                blurRadius: 10,
                                                offset: Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            product.imageUrl,
                                            width: 168,
                                            height: 178,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 7),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'lib/src/assets/Rectangle.png',
                                                  width: 40,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 0),
                                              child: Icon(Icons.add,
                                                  size: 16,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${product.originalprice} đ ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' ${product.discountedprice} đ',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFD61355),
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor:
                                                  Color(0xFFD61355),
                                              decorationThickness: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      : Center(
                          child: Text('No outstanding products available'),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
