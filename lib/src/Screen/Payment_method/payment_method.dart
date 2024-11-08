import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/payment_type_item.dart';
import 'widgets/add_new_card_button.dart';
import 'widgets/choose_button.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int? _selectedPaymentIndex = 0;
  final List<PaymentType> paymentTypes = [
    PaymentType("lib/src/assets/payment/visa.png"),
    PaymentType("lib/src/assets/payment/paypal.png"),
    PaymentType("lib/src/assets/payment/mastercard.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 17),
                const Text(
                  'Thẻ đã lưu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 0.09,
                    letterSpacing: -0.21,
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  children: List.generate(paymentTypes.length, (index) {
                    return PaymentTypeItem(
                      index: index,
                      selectedPaymentIndex: _selectedPaymentIndex,
                      imagePath: paymentTypes[index].imagePath,
                      onSelected: (value) {
                        setState(() {
                          _selectedPaymentIndex = value;
                        });
                      },
                    );
                  }),
                ),
                const AddNewCardButton(),
                const Spacer(),
                const ChooseButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentType {
  final String imagePath;

  PaymentType(this.imagePath);
}
