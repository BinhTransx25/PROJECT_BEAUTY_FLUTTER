import 'package:flutter/material.dart';
import '../../service/order/orderserver.dart';
import '../../models/home/ordermodel.dart'; 
import '../../app/tabs/bottom_nav_bar.dart';

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Order> orders = [];
  final OrderService _orderService = OrderService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      List<Order> fetchedOrders = await _orderService.fetchOrders();
      setState(() {
        orders = fetchedOrders;
      });
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  String getStatus(String status) {
    switch (status) {
      case 'pending':
        return 'Chưa giải quyết';
      case 'confirmed':
        return 'Đã xác nhận';
      case 'shipping':
        return 'Đang vận chuyển';
      case 'cancelled':
        return 'Đã hủy';
      case 'completed':
        return 'Hoàn tất';
      default:
        return 'Không xác định';
    }
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
              child: Tab(text: 'Chưa giải quyết'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Tab(text: 'Đã xác nhận'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Tab(text: 'Đang vận chuyển'),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Tab(text: 'Đã hủy'),
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
          buildOrderList(
              orders.where((order) => order.status == 'pending').toList(),
              true),
          buildOrderList(
              orders.where((order) => order.status == 'confirmed').toList(),
              false),
          buildOrderList(
              orders.where((order) => order.status == 'shipping').toList(),
              false),
          buildOrderList(
              orders.where((order) => order.status == 'cancelled').toList(),
              false),
          buildOrderList(
              orders.where((order) => order.status == 'completed').toList(),
              false),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Widget buildOrderList(List<Order> orders, bool isOngoing) {
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
                          child: Image.network(
                            'https://hoangphucphoto.com/wp-content/uploads/2024/08/anh-son-2.jpg',
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
                                'Son môi',
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
                                    '${order.totalOrder}đ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
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
                                getStatus(order.status),
                                style: TextStyle(
                                  color: getStatusColor(order.status),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            if (order.status != 'completed')
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Thông tin đơn hàng'),
                                        content: Text(
                                            'Chi tiết đơn hàng: ${order.code}'),
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
                                  backgroundColor: Colors.pink,
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            if (order.status == 'completed')
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
                                            order.rating = rating;
                                            order.feedback = feedback;
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
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
                                    fontWeight: FontWeight.bold,
                                  ),
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

  Color getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return const Color.fromARGB(255, 27, 211, 33);
      case 'confirmed':
        return Colors.blue;
      case 'processing':
      case 'shipping':
        return Colors.red;
      case 'cancelled':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}

class RatingBottomSheet extends StatefulWidget {
  final Order order;
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
    rating = widget.order.rating; 
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
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(thickness: 2, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'Đơn hàng bạn thế nào?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  size: 36,
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
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            ),
            maxLines: 5,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.onRatingSubmitted(rating, feedbackController.text);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'Gửi đánh giá',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}