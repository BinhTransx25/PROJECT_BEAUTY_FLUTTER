import 'package:flutter/material.dart';
import 'widgets/AppBarWidget.dart';
import 'widgets/AddressItemWidget.dart';
import 'widgets/AddAddressButton.dart';
import 'widgets/ChooseAddressButton.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  AddressItemWidget(
                    isDefault: true,
                    isChecked: false,
                    onChanged: (value) {},
                  ),
                  AddressItemWidget(
                    isDefault: false,
                    isChecked: false,
                    onChanged: (value) {},
                  ),
                  AddAddressButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          ChooseAddressButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
