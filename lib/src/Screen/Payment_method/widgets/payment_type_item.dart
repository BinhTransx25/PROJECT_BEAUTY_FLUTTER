import 'package:flutter/material.dart';

class PaymentTypeItem extends StatelessWidget {
  final int index;
  final int? selectedPaymentIndex;
  final String imagePath;
  final ValueChanged<int?> onSelected;

  const PaymentTypeItem({
    super.key,
    required this.index,
    required this.selectedPaymentIndex,
    required this.imagePath,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x3F000000)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: RadioListTile<int>(
          title: Row(
            children: [
              Image.asset(
                imagePath,
                width: 35,
                height: 35,
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '**** **** **** 2525',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (index == 0)
                Container(
                  width: 65,
                  height: 21,
                  color: const Color(0xFFF4F4F4),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      'Mặc định',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                        letterSpacing: -0.17,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          value: index,
          groupValue: selectedPaymentIndex,
          onChanged: onSelected,
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.black,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
        ),
      ),
    );
  }
}
