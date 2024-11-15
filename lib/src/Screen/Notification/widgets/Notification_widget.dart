import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class NotificationHeader extends StatelessWidget {
  final String title;

  const NotificationHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
  children: [
    GestureDetector(
      onTap: () {
        context.go('/account');
        // Thực hiện hành động khi nhấn vào icon
        print("Back icon tapped");
        // Ví dụ: quay lại trang trước
        
      },
      child: Icon(Icons.arrow_back_ios, size: 24),
    ),
    Expanded(
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  ],
);

  }
}

class NotificationOptionRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationOptionRow({
    required this.title,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
            inactiveThumbColor: Color.fromARGB(255, 224, 224, 224),
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class NotificationDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFD9D9D9),
      thickness: 2,
    );
  }
}
