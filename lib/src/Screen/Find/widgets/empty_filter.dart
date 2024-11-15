import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'basic_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            SvgIconPaths.find_err,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Không có sản phẩm phù hợp',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
          Text(
            'Bạn hãy thử điều kiện lọc khác nhé',
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Text(
            "Hoặc",
            style: TextStyle(fontSize: 15, color: Color(0xff202020)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          BasicCustomButton(title: "Xóa bộ lọc")
        ],
      ),
    );
  }
}
