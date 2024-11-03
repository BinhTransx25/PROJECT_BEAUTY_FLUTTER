import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;

  const ProfileTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 149, 145, 145)),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 182, 221, 243)),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.only(left: 5),
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(suffixIcon, size: 20),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
