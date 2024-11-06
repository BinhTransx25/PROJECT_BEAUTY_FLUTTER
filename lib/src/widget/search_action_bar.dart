import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:beauty/src/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchActionBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? filterSuccessful;

  const SearchActionBar({super.key, this.filterSuccessful});

  @override
  Widget build(BuildContext context) {
    final showFilterSuccessfulIcon = filterSuccessful ?? false;
    final displayFilterIcon = showFilterSuccessfulIcon
        ? SvgIconPaths.filter
        : SvgIconPaths.filter_successful;

    return AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true, // Căn giữa tiêu đề
      titleSpacing: 0,
      title: SearchBox(),
      leading: IconButton(
        icon: SvgPicture.asset(
          SvgIconPaths.arrow_back_ios,
          width: 15,
          height: 15,
        ),
        onPressed: () {
          // Thêm hành động khi nút được nhấn
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            displayFilterIcon,
            width: 30,
            height: 30,
          ), // Icon filter ở bên phải
          onPressed: () {
            // Thêm hành động khi nút được nhấn
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
