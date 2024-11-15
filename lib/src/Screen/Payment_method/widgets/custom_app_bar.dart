import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(68.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late String previousPage; // Biến lưu tên trang trước

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Nhận tham số từ trang trước đó với null check
    final routeState = GoRouter.of(context).state;
    previousPage = routeState?.extra as String? ?? 'unknown'; // Sử dụng giá trị mặc định nếu extra là null
  }

  void _goBack() {
    if (previousPage == 'account') {
      context.go('/account'); // Trở về trang SMS
    } else if (previousPage == 'checkout') {
      context.go('/checkout'); // Trở về trang Email
    } else {
      context.pop(); // Hoặc quay lại trang trước nếu không có thông tin cụ thể
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      toolbarHeight: 68,
      title: const Text(
        'Phương Thức Thanh Toán',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      leading: IconButton(
        onPressed: _goBack,
        icon: Image.asset(
          "lib/src/assets/payment/back.png",
          width: 20,
          height: 20,
          fit: BoxFit.fill,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            color: const Color(0xFFD9D9D9),
            height: 2.0,
          ),
        ),
      ),
    );
  }
}
