import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Label extends StatelessWidget {
  final String title;
  final bool? showRightIcon;

  const Label({super.key, required this.title, this.showRightIcon});

  @override
  Widget build(BuildContext context) {
    final bool showIcon = showRightIcon ?? false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        if (showIcon)
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: Color(0xfff9f9f9),
              shape: BoxShape.circle,
            ),
            child: Align(         // ép SvgPicture để nó nhận kích thước của SizedBox thay vì nhận của Container
              alignment: Alignment.center,
              child: SizedBox(
                width: 15,
                height: 15,
                child: SvgPicture.asset(
                  SvgIconPaths.delete,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
