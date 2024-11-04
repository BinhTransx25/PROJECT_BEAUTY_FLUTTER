import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/voucher_item.dart';

class VouchersScreen extends StatelessWidget {
  const VouchersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Phiếu Giảm Giá'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            5,
            (index) => VoucherItem(),
          ),
        ),
      ),
    );
  }
}
