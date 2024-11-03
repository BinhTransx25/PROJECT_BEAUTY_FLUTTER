import 'package:flutter/material.dart';
import 'widgets/app_bar.dart';
import 'widgets/card_number_field.dart';
import 'widgets/expiration_date_cvc_field.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Thêm thẻ tín dụng hoặc thẻ ghi nợ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CardNumberField(formKey: _formKey),
                  const SizedBox(height: 30),
                  const ExpirationDateCVCField(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
