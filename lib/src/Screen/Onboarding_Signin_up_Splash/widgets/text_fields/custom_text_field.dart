import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.suffixIcon,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.textError = '',
    required this.onChanged,
  });

  final TextEditingController controller;
  final Icon? suffixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String textError;
  final Function(String) onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  void handleHide() {
    setState(() {
      isHide = !isHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(),
          height: 55,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 239),
            borderRadius: BorderRadius.circular(24),
          ),
          child: SizedBox(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword && isHide,
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged, // Gọi hàm onChanged
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  borderSide: BorderSide(
                    color: widget.textError.isNotEmpty
                        ? Colors.red
                        : (widget.controller.text.isNotEmpty
                            ? Colors.green
                            : Colors.transparent),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  borderSide: BorderSide(
                    color: widget.textError.isNotEmpty
                        ? Colors.red
                        : (widget.controller.text.isNotEmpty
                            ? Colors.green
                            : Colors.transparent),
                  ),
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: handleHide,
                        icon: Icon(
                          isHide ? Icons.visibility : Icons.visibility_off,
                        ),
                      )
                    : widget.suffixIcon,
              ),
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        if (widget.textError.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            widget.textError,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ),
        ],
      ],
    );
  }
}
