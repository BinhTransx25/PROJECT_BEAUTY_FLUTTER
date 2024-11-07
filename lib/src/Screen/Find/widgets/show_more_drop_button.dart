import 'package:beauty/src/constants/svg_icon_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ShowMoreDropButtonType { showMore, hide }

class ShowMoreDropButton extends StatelessWidget {
  final String title;
  final ShowMoreDropButtonType? type;
  final VoidCallback? onPressed;

  const ShowMoreDropButton({
    Key? key,
    this.type,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShowMoreDropButtonType buttonType =
        type ?? ShowMoreDropButtonType.showMore;

    final iconPath = buttonType == ShowMoreDropButtonType.showMore
        ? SvgIconPaths.arrow_dropdown_ios
        : SvgIconPaths.arrow_dropup_ios;

    return Container(
      width: double.infinity, // Chiều rộng bằng với màn hình
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(
      //       color: Color(0xffE4E7EC), // Màu của đường ngang
      //       width: 1.0, // Độ dày của đường ngang
      //     ),
      //   ),
      // ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 15, color: Color(0xff202020)), // Kích thước chữ
            ),
            SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              iconPath,
              width: 10,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

// class ExpandableList extends StatefulWidget {
//   @override
//   _ExpandableListState createState() => _ExpandableListState();
// }

// class _ExpandableListState extends State<ExpandableList> {
//   bool _isExpanded = false;
//   final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: _isExpanded
//                 ? _items.length
//                 : (_items.length > 4 ? 4 : _items.length),
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(_items[index]),
//               );
//             },
//           ),
//         ),
//         ShowMoreDropButton(
//           title: _isExpanded ? 'Thu gọn' : 'Xem thêm',
//           type: _isExpanded
//               ? ShowMoreDropButtonType.hide
//               : ShowMoreDropButtonType.showMore,
//           onPressed: () {
//             setState(() {
//               _isExpanded = !_isExpanded;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
