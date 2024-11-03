import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(68.0),
        super(key: key);

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
        onPressed: () {},
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
