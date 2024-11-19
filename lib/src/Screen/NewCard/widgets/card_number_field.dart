import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const CardNumberField({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Số thẻ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: const Text(
              'Thêm mã số thẻ',
              style: TextStyle(
                color: Color(0xFFDADADA),
                fontSize: 16,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Color(0xFFDADADA), width: 1.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '*Số thẻ không đúng, vui lòng thử lại';
            }
            return null;
          },
          maxLength: 19,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ],
    );
  }
}
