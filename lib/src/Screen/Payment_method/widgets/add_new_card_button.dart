import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewCardButton extends StatelessWidget {
  const AddNewCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 21),
      height: 44,
      child: TextButton(
        onPressed: () {
              context.go('/newcard');

        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(width: 1, color: Color(0x3F000000)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/src/assets/payment/plus.png",
              width: 12,
              height: 12,
            ),
            const SizedBox(width: 10),
            const Text(
              'Thêm thẻ mới',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0.10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
