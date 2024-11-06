import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSuggestion extends StatelessWidget {
  final String text;
  final bool? showIcon;

  const SearchSuggestion({super.key, required this.text, this.showIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 13),
              ),
              if (showIcon == true)
                Padding(
                  padding: const EdgeInsets.only(
                      right:
                          10.0), // Thay đổi giá trị để điều chỉnh khoảng cách
                  child: SvgPicture.asset(
                    SvgIconPaths.multiply,
                    width: 15,
                    height: 15,
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: Color(0xFFD9D9D9), height: 2),
        ],
      ),
    );
  }
}
