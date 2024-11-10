import 'package:flutter/material.dart';

// Widget cho Header với nhãn 'Tài Khoản'
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 20),
      child: Text(
        'Tài Khoản',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Widget cho mỗi dòng tùy chọn
class OptionRow extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;

  const OptionRow({
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, width: 25, height: 25),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      trailing: Image.asset('lib/src/assets/Account/ArrowRight.png',
          width: 25, height: 25),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 5),
    );
  }
}

// Widget cho Divider với padding bên trái
class DividerWithPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xFFD9D9D9),
      thickness: 2,
      indent: 40,
    );
  }
}
