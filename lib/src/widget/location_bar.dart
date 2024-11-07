import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationBar extends StatelessWidget implements PreferredSizeWidget {
  final String address;

  const LocationBar({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffffffff),
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Địa chỉ",
            style: TextStyle(fontSize: 13),
          ),
          Row(
            children: [
              Text(
                address,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                SvgIconPaths.arrow_dropdown_ios,
                width: 10,
                height: 5,
              )
            ],
          )
        ],
      ),
      leading: IconButton(
        icon: SvgPicture.asset(SvgIconPaths.arrow_back_ios),
        onPressed: () {
          // Thêm hành động khi nút được nhấn
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
