import 'dart:developer';

import 'package:beauty/src/api/category_sevice.dart';
import 'package:beauty/src/models/home/catergory.dart';

import 'widgets/basic_custom_button.dart';
import 'widgets/show_more_drop_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<String> titles = [
  'Tẩy trang',
  'Dụng cụ trang điểm',
  'Sữa tắm',
  'Chăm sóc da mặt',
  'Tẩy trang',
  'Dụng cụ trang điểm',
  'Sữa tắm',
  'Chăm sóc da mặt',
];

class Filter extends StatelessWidget {
  Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(58, 214, 19, 84),
        toolbarHeight: 70,
        title: Text(
          "Bộ lọc theo tìm kiếm",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Theo Danh Mục",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  CategoryList(),
                  Divider(color: Color(0xFFD9D9D9), height: 1),
                  SizedBox(height: 20),
                  Text(
                    "Nơi bán",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  ButtonList(
                    titles: titles,
                  ),
                  Divider(color: Color(0xFFD9D9D9), height: 1),
                  SizedBox(height: 20),
                  Text(
                    "Thương hiệu",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  ButtonList(
                    titles: titles,
                  ),
                  Divider(color: Color(0xFFD9D9D9), height: 1),
                  SizedBox(height: 20),
                  Text(
                    "Đánh giá",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  RatingButtonList(
                    titles: [
                      "5 sao",
                      "Từ 4 sao",
                      "Từ 3 sao",
                      "Từ 2 sao",
                      "Từ 1 sao",
                    ],
                    isUnlimitedDisplayItem: true,
                  ),
                  SizedBox(height: 10),
                  Divider(color: Color(0xFFD9D9D9), height: 1),
                  SizedBox(height: 20),
                  Text(
                    "Khoảng Giá (đ)",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  PriceRangeSelector()
                ],
              ),
            ),
            SizedBox(height: 5),
            Divider(color: Color(0xFFD9D9D9), height: 1),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BasicCustomButton(
                  title: 'Thiết lập lại',
                  type: BasicCustomButtonType.outline,
                  size: BasicCustomButtonSize.medium,
                  onPressed: () {},
                ),
                BasicCustomButton(
                  title: 'Áp dụng',
                  type: BasicCustomButtonType.primary,
                  size: BasicCustomButtonSize.medium,
                  onPressed: () {
                    context.go('/find');
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ButtonList extends StatefulWidget {
  final List<String> titles;
  final bool? isUnlimitedDisplayItem;

  const ButtonList(
      {super.key, required this.titles, this.isUnlimitedDisplayItem});

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  bool isExpanded = false; // Biến trạng thái để điều khiển hiển thị
  int? selectedIndex; // Lưu trạng thái nút được chọn

  @override
  Widget build(BuildContext context) {
    final hideButton = widget.isUnlimitedDisplayItem ?? false;

    // Đảm bảo không vượt quá số lượng phần tử trong titles
    final itemsToShow = !hideButton
        ? (isExpanded ? widget.titles.length : widget.titles.length.clamp(0, 4))
        : widget.titles.length;

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4 / 1,
          ),
          itemCount: itemsToShow,
          itemBuilder: (context, index) {
            // Kiểm tra và chỉ tạo nút khi index hợp lệ
            if (index < widget.titles.length) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // Cập nhật nút được chọn
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.pink : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.titles[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox(); // Trả về widget rỗng nếu index không hợp lệ
            }
          },
        ),
        if (!hideButton)
          ShowMoreDropButton(
            title: isExpanded ? 'Thu gọn' : 'Xem thêm',
            type: isExpanded
                ? ShowMoreDropButtonType.hide
                : ShowMoreDropButtonType.showMore,
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded; // Đổi trạng thái khi nhấn nút
              });
            },
          ),
      ],
    );
  }
}

class RatingButtonList extends StatefulWidget {
  final List<String> titles;
  final bool? isUnlimitedDisplayItem;

  const RatingButtonList({
    Key? key,
    required this.titles,
    this.isUnlimitedDisplayItem,
  }) : super(key: key);

  @override
  _RatingButtonListState createState() => _RatingButtonListState();
}

class _RatingButtonListState extends State<RatingButtonList> {
  bool isExpanded = false; // Control the display state
  int selectedRange = 1; // Track which button is selected

  @override
  Widget build(BuildContext context) {
    final hideButton = widget.isUnlimitedDisplayItem ?? false;

    // Determine the number of items to show
    final itemsToShow = !hideButton
        ? (isExpanded ? widget.titles.length : 4)
        : widget.titles.length;

    return Column(
      children: [
        SizedBox(
          height: (itemsToShow / 2).ceil() * 50.0,
          child: GridView.builder(
            key: ValueKey(
                itemsToShow), // Khóa duy nhất cho các bản cập nhật động // không thì lỗi ' _elements.contains(element) ' is not true
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4 / 1,
            ),
            itemCount: itemsToShow,
            itemBuilder: (context, index) {
              return BasicCustomButton(
                key: ValueKey(index),
                title: widget.titles[index],
                type: selectedRange == (index + 1)
                    ? BasicCustomButtonType.primary
                    : BasicCustomButtonType.secondary,
                size: BasicCustomButtonSize.small,
                onPressed: () {
                  setState(() {
                    selectedRange = index + 1;
                  });
                },
              );
            },
          ),
        ),
        if (!hideButton)
          ShowMoreDropButton(
            title: isExpanded ? 'Thu gọn' : 'Xem thêm',
            type: isExpanded
                ? ShowMoreDropButtonType.hide
                : ShowMoreDropButtonType.showMore,
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
      ],
    );
  }
}

class PriceRangeSelector extends StatefulWidget {
  @override
  _PriceRangeSelectorState createState() => _PriceRangeSelectorState();
}

class _PriceRangeSelectorState extends State<PriceRangeSelector> {
  int selectedRange =
      1; // 0: No selection, 1: First button, 2: Second, 3: Third
  double minValue = 0;
  double maxValue = 100000;

  // Function to update the price range
  void updateRange(int range) {
    setState(() {
      selectedRange = range;
      if (range == 1) {
        minValue = 0;
        maxValue = 100000;
      } else if (range == 2) {
        minValue = 100000;
        maxValue = 200000;
      } else if (range == 3) {
        minValue = 200000;
        maxValue = 300000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = 160.0;
    final buttonHeight = 41.0;
    final backgroundColor = Color(0xffF4F4F4);
    final titleColor = Color(0xff000000);
    // final borderColor = Color(0xffD61355);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Create two text widgets with the same style as the button
            Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  minValue.toStringAsFixed(0),
                  style: TextStyle(fontSize: 15.0, color: titleColor),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(width: 30, height: 1, color: Colors.black),
            SizedBox(width: 10),
            Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  maxValue.toStringAsFixed(0),
                  style: TextStyle(fontSize: 15.0, color: titleColor),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BasicCustomButton(
              title: '0 - 100k',
              type: selectedRange == 1
                  ? BasicCustomButtonType.primary
                  : BasicCustomButtonType.secondary,
              size: BasicCustomButtonSize.small,
              onPressed: () {
                setState(() {
                  updateRange(1);
                });
              },
            ),
            BasicCustomButton(
              title: '100k - 200k',
              type: selectedRange == 2
                  ? BasicCustomButtonType.primary
                  : BasicCustomButtonType.secondary,
              size: BasicCustomButtonSize.small,
              onPressed: () {
                setState(() {
                  updateRange(2);
                });
              },
            ),
            BasicCustomButton(
              title: '200k- 300k',
              type: selectedRange == 3
                  ? BasicCustomButtonType.primary
                  : BasicCustomButtonType.secondary,
              size: BasicCustomButtonSize.small,
              onPressed: () {
                setState(() {
                  updateRange(3);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoryService _categoryService = CategoryService();
  List<Category> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final fetchedCategories = await _categoryService.getCategories();
      setState(() {
        categories = fetchedCategories;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error loading categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Chuyển danh sách categories thành danh sách chuỗi titles
    final titles = categories.map((category) => category.name).toList();
    print("dddd____________________dđd" + categories.toString());
    print("dddd____________________dđd" + titles.toString());
    log( titles.toString(), name: "dddd____________________dđd" );

    return isLoading
        ? const Center(child: CircularProgressIndicator()) // Hiển thị loading
        : ButtonList(titles: titles); // Truyền titles vào ButtonList
  }
}

