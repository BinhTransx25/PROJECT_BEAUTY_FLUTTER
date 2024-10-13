
import 'package:flutter/material.dart';

class SplashBuilder extends StatelessWidget {
  final Future<void> Function() onInit; // Hàm async khởi tạo khi màn hình Splash được hiển thị
  final Widget splashScreen; // Widget hiển thị trong khi đang khởi tạo
  final Widget homeScreen; // Widget chính được hiển thị sau khi khởi tạo xong

  const SplashBuilder({
    Key? key, // (không bắt buộc)
    required this.onInit,
    required this.splashScreen,
    required this.homeScreen,
  }) : super(key: key); // Gọi hàm khởi tạo của lớp cha (StatelessWidget)

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: onInit(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return splashScreen; // Hiển thị màn hình splash
        } else {
          return homeScreen; // Hiển thị trang chủ khi xong
        }
      },
    );
  }
}

// ConnectionState.none: Chưa bắt đầu thực thi Future.
// ConnectionState.waiting: Đang chờ Future hoàn thành.
// ConnectionState.active: Đang tiến hành, nhưng chưa hoàn thành (thường gặp khi làm việc với Stream).
// ConnectionState.done: Future đã hoàn thành (thành công hoặc thất bại).


// Ex:
// SplashBuilder(
//   onInit: () async {
//     await Future.delayed(Duration(seconds: 3)); // Giả lập chờ 3 giây
//   },
//   splashScreen: SplashScreenWidget(), // Widget cho màn hình splash
//   homeScreen: HomePageWidget(), // Widget cho trang chủ
// )
