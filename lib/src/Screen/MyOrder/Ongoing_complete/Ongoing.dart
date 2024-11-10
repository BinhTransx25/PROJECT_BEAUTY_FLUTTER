import 'package:flutter/material.dart';
import '../../../app/tabs/bottom_nav_bar.dart';

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> ongoingOrders = [
    {
      'id': '001',
      'name': 'Son L\'Oreal',
      'price': 150000,
      'discount': 10000,
      'status': 'Đang vận chuyển',
    },
    {
      'id': '002',
      'name': 'Son L\'Oreal',
      'price': 150000,
      'discount': 10000,
      'status': 'Đang vận chuyển',
    },
  ];

  final List<Map<String, dynamic>> completedOrders = [
    {
      'id': '003',
      'name': 'Son L\'Oreal',
      'price': 150000,
      'discount': 10000,
      'status': 'Hoàn thành',
      'rating': 0, // Default rating
    },
    {
      'id': '004',
      'name': 'Son L\'Oreal',
      'price': 150000,
      'discount': 10000,
      'status': 'Hoàn thành',
      'rating': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đơn Hàng Của Tôi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.pink,
                width: 3.0,
              ),
            ),
          ),
          tabs: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Tab(text: 'Đang vận chuyển'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Tab(text: 'Hoàn tất'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildOrderList(ongoingOrders, true),
          buildOrderList(completedOrders, false),
        ],
      ),

 bottomNavigationBar: const BottomNavBar(
              currentIndex: 2), // Đánh dấu màn hình này là mục đầu tiên
    );
  }

  Widget buildOrderList(List<Map<String, dynamic>> orders, bool isOngoing) {
    return Padding(
      padding: EdgeInsets.only(top: 12, left: 22, right: 22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final discountedPrice = order['price'] - order['discount'];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'lib/src/assets/MyOrder/son.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order['name'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${order['price']}đ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${discountedPrice}đ',
                                    style: TextStyle(
                                      color: Colors.pink,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.pink,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.grey[200],
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: Text(
                                order['status'],
                                style: TextStyle(
                                    color: order['status'] == 'Hoàn thành'
                                        ? const Color.fromARGB(255, 27, 211, 33)
                                        : Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 10),
                            if (isOngoing)
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Thông tin đơn hàng'),
                                        content: Text(
                                            'Chi tiết đơn hàng: ${order['id']}'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Đóng'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink, // Màu nền nút
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Xem đơn hàng',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.bold), // Màu chữ nút
                                ),
                              ),
                            if (!isOngoing && order['status'] == 'Hoàn thành')
                              ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RatingBottomSheet(
                                        order: order,
                                        onRatingSubmitted:
                                            (int rating, String feedback) {
                                          setState(() {
                                            order['rating'] = rating;
                                            order['feedback'] = feedback;
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink, // Màu nền nút
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Đánh giá',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.bold), // Màu chữ nút
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBottomSheet extends StatefulWidget {
  final Map<String, dynamic> order;
  final Function(int, String) onRatingSubmitted;

  RatingBottomSheet({required this.order, required this.onRatingSubmitted});

  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  late int rating;
  TextEditingController feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    rating = widget.order['rating'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đánh giá',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'lib/src/assets/MyOrder/Arrow_down.png',
                width: 36,
                height: 36,
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 2,
            color: const Color.fromARGB(255, 194, 194, 194),
          ),
          SizedBox(height: 10),
          Text(
            'Đơn hàng bạn thế nào?',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4),
          Text(
            'Xin hãy đánh giá và để lại phản hồi',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 36, // Điều chỉnh kích thước sao
                ),
                onPressed: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
              );
            }),
          ),
          SizedBox(height: 10),
          TextField(
            controller: feedbackController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Điền phản hồi của bạn',
              contentPadding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: 10), // Điều chỉnh padding
            ),
            maxLines: 5, // Số dòng tối đa
            style: TextStyle(fontSize: 16), // Tăng kích thước chữ
          ),
          SizedBox(height: 16),
          Center(
            // Căn giữa nút
            child: ElevatedButton(
              onPressed: () {
                widget.onRatingSubmitted(rating, feedbackController.text);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Màu nền nút
                minimumSize: Size(
                    double.infinity, 50), // Đặt chiều rộng đầy đủ và chiều cao
              ),
              child: Text(
                'Gửi đánh giá',
                style:
                    TextStyle(color: Colors.white, fontSize: 20), // Màu chữ nút
              ),
            ),
          ),
        ],
      ),
    );
  }
}
