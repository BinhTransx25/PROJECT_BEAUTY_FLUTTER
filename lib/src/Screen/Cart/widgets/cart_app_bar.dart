import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Giỏ hàng',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'lib/src/assets/Cart/arrowleft.svg',
          height: 20,
          width: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          child: SvgPicture.asset(
            'lib/src/assets/Cart/trash.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
