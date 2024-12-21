import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Theo dõi đơn hàng',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            'lib/src/assets/MyOrder/goback.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            Image.asset(
              'lib/src/assets/MyOrder/map.png',
              width: double.infinity,
              height: 360,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trạng thái đơn hàng',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Image.asset('lib/src/assets/MyOrder/Arrow_down.png'),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildMilestone('Đóng gói', 'QL20 Đèo Prenn, Phường 3, Đà Lạt, Lâm Đồng', true),
                  _buildMilestone('Đã chọn', 'QL20 Đèo Prenn, Phường 3, Đà Lạt, Lâm Đồng', true),
                  _buildMilestone('Đang vận chuyển', 'QL20 Đèo Prenn, Phường 3, Đà Lạt, Lâm Đồng', false),
                  _buildMilestone('Đã giao', 'QL20 Đèo Prenn, Phường 3, Đà Lạt, Lâm Đồng', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestone(String title, String subtitle, bool isCompleted) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Thay thế chấm tròn bằng ảnh
            Image.asset(
              isCompleted
                  ? 'lib/src/assets/MyOrder/radiogroup.png' 
                  : 'lib/src/assets/MyOrder/unradiogroup.png', 
              width: 20,
              height: 20,
            ),
            // Chỉ hiển thị gạch đứt nếu trạng thái là hoàn thành
            if (isCompleted)
              Padding(
                padding: const EdgeInsets.only(top: 4), // Khoảng cách giữa ảnh và gạch đứt
                child: _buildConnectionLine(),
              ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionLine() {
    return CustomPaint(
      size: Size(0, 30), // Chiều cao của đường gạch đứt
      painter: DashedLinePainter(),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Đổi màu gạch đứt thành đen
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double dashHeight = 3; // Chiều cao gạch đứt
    double dashSpace = 3; // Khoảng cách giữa các đoạn gạch đứt
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(DashedLinePainter oldDelegate) {
    return false;
  }
}
