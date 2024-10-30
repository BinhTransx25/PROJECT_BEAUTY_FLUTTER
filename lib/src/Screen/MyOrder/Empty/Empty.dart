import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn hàng của tôi',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.pink, width: 4),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/src/Screen/MyOrder/assets/unorder.png',
                    width: 160, height: 160),
                // SizedBox(height: 10),
                Text(
                  'Không có đơn hàng',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Bạn không có đơn hàng lúc này',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Center(child: Text('Nội dung Hoàn tất')),
        ],
      ),
    );
  }
}
