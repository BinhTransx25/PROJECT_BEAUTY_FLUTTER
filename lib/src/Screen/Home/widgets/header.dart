// lib/widgets/header.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  final int notificationCount;

  const Header({Key? key, required this.notificationCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    fontWeight: FontWeight.w400,
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
                  child: GestureDetector(
                    onTap: () {
                      // Thực hiện hành động khi nhấn vào biểu tượng thông báo
                      print('Notification icon tapped');
                      // Bạn có thể điều hướng đến một trang khác hoặc hiển thị thông báo
                      context.go('/notification');
                    },
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                if (notificationCount > 0)
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
                        '$notificationCount',
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
                  'lib/src/assets/Home/Ellipse.png',
                  width: 60,
                  height: 60,
                ),
                ClipOval(
                  child: Image.asset(
                    'lib/src/assets/Home/avatar.png',
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
            Expanded(
  child: GestureDetector(
    onTap: () {
      // Thực hiện hành động khi nhấn vào thanh tìm kiếm, như chuyển sang trang tìm kiếm
      print('Search bar tapped');
      context.go('/find');
      // Ví dụ: Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
    },
    child: Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Color(0xFFD6D6D6)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(Icons.search, color: Color(0xFF878787)),
          ),
          Expanded(
            child: Text(
              'Tìm kiếm sản phẩm',
              style: TextStyle(
                color: Color(0xFF878787),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
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
        )
      ],
    );
  }
}
