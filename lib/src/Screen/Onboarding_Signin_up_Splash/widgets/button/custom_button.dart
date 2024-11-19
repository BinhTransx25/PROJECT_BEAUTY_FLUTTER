import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
    this.textStyle, // Tùy chọn cho TextStyle của nút
    this.buttonStyle, // Tùy chọn cho toàn bộ ButtonStyle
  });

  final String title;
  final VoidCallback onPress;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPress,
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD61355),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              textStyle: textStyle ??
                  const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
              elevation: 8, // Độ cao của bóng
              shadowColor: Colors.black.withOpacity(1), // Màu của đổ bóng
            ),
        child: Text(
          title,
          style: textStyle ?? const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
