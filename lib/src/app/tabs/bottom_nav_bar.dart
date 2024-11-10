// lib/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/favourite');
        break;
      case 2:
        context.go('/ongoing');
        break;
      case 3:
        context.go('/cart');
        break;
      case 4:
        context.go('/account');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      selectedItemColor: Color(0xFFD61355), // Màu cho icon được chọn
      unselectedItemColor: Colors.grey, // Màu bạc cho icon không được chọn
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor_heart),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_travel_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
    );
  }
}
