import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      decoration: BoxDecoration(
        color: Color(0xfff8f8f8), // Màu nền
        borderRadius: BorderRadius.circular(30.0), // Border radius
        border: Border.all(color: Color(0xffd6d6d6)), // Viền
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none, // Không viền bên trong
          hintText: 'Tìm kiếm sản phẩm',
          hintStyle: TextStyle(color: Color(0xff878787), fontSize: 14),
          counterStyle: TextStyle(color: Color(0xff878787), fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20), // Padding cho biểu tượng
            child: SvgPicture.asset(
              SvgIconPaths.find,
              // color: Color(0xff878787),
              width: 15,
              height: 15,
            ), // Biểu tượng bên trái
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 0.0), // Padding cho nội dung
        ),
      ),
    );
  }
}
