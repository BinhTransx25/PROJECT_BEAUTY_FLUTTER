import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BasicActionBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BasicActionBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      AppBar(
        backgroundColor: Color(0xffffffff),
        centerTitle: true, // Căn giữa tiêu đề
        titleSpacing: 0,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            SvgIconPaths.arrow_back_ios,
            width: 15,
            height: 15,
          ),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      SizedBox(height: 15),
      Divider(color: Color(0xFFD9D9D9), height: 2),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight +
      17); // kToolbarHeight + kích thước thêm của SizedBox và Divider
}
