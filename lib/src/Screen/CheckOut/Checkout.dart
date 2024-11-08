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
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ShippingAddress(),
            SizedBox(height: 20),
            Divider(
                color: const Color.fromARGB(255, 189, 189, 189), thickness: 1),
            SizedBox(height: 20),
            PaymentMethod(),
            SizedBox(height: 20),
            Divider(
                color: const Color.fromARGB(255, 189, 189, 189), thickness: 1),
            SizedBox(height: 20),
            Coupon(),
            SizedBox(height: 20),
            Divider(
                color: const Color.fromARGB(255, 189, 189, 189), thickness: 1),
            SizedBox(height: 20),
            OrderSummary(),
          ],
        ),
      ),
      bottomNavigationBar: OrderButton(),
      
    );
  }
}
