import 'package:flutter/material.dart';

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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          toolbarHeight: 68,
          title: const Text(
            'Phương Thức Thanh Toán',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              "lib/src/assets/payment/back.png",
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.0),
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                color: const Color(0xFFD9D9D9),
                height: 2.0,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
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
                                  paymentTypes[index].imagePath,
                                  width: 35,
                                  height: 35,
                                ),
                                const SizedBox(width: 14),
                                const Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    // Điều chỉnh văn bản để nhỏ lại nếu cần
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
                                if (index == 0) ...[
                                  Container(
                                    width: 54.59,
                                    height: 21,
                                    color: const Color(0xFFF4F4F4),
                                    child: const FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.center,
                                        // Điều chỉnh văn bản để nhỏ lại nếu cần
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
                                        )),
                                  ),
                                ],
                              ],
                            ),
                            value: index,
                            groupValue: _selectedPaymentIndex,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentIndex = value;
                                print(
                                    "[Payment_method]\tSelected index:$_selectedPaymentIndex");
                              });
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: Colors.black,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 13.0),
                          ),
                        ));
                  }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 21),
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        width: 1,
                        color: Color(0x3F000000),
                      ),
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
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.85,
                    child: SizedBox(
                      height: 61,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xEED61355),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Lựa Chọn',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ),
                )
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
