import 'package:flutter/material.dart';
import 'widgets/CustomAppBar.dart';
import 'widgets/ShippingAddress.dart';
import 'widgets/PaymentMethod.dart';
import 'widgets/Coupon.dart';
import 'widgets/OrderSummary.dart';
import 'widgets/OrderButton.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShippingAddress(),
            Divider(color: Colors.grey, thickness: 1),
            PaymentMethod(),
            Divider(color: Colors.grey, thickness: 1),
            Coupon(),
            Divider(color: Colors.grey, thickness: 1),
            OrderSummary(),
          ],
        ),
      ),
      bottomNavigationBar: OrderButton(),
    );
  }
}
