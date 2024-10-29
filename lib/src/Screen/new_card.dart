import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              toolbarHeight: 68,
              title: const Text(
                'Thêm thẻ mới',
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
                width: double.infinity,
                height: double.infinity,
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
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                            height: 0.09,
                            letterSpacing: -0.21,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Số thẻ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.12,
                            letterSpacing: -0.21,
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
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.06,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFDADADA),
                                // Màu khi không có focus
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFDADADA),
                                // Màu khi không có focus
                                width: 1.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEF2E2E),
                                // Màu khi không có focus
                                width: 1.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color(0xFFEF2E2E),
                                // Màu khi không có focus
                                width: 1.0,
                              ),
                            ),
                            errorStyle: const TextStyle(
                              color: Color(
                                  0xFFEF2E2E), // Thay đổi màu chữ của thông báo lỗi tại đây
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            counterText: '', //ẩn 0/19
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '*Số thẻ không đúng, vui lòng thử lại ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            print('Saved value: $value');
                          },
                          maxLength: 19,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            CardNumberInputFormatter()
                            // Chỉ cho phép ký tự số
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ngày hết hạn',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0.12,
                                    letterSpacing: -0.21,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    label: const Text(
                                      'MM/YY',
                                      style: TextStyle(
                                        color: Color(0xFFDADADA),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 0.06,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFDADADA),
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFDADADA),
                                        // Màu khi không có focus
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEF2E2E),
                                        // Màu khi không có focus
                                        width: 1.0,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEF2E2E),
                                        // Màu khi không có focus
                                        width: 1.0,
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      color: Color(
                                          0xFFEF2E2E), // Thay đổi màu chữ của thông báo lỗi tại đây
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    counterText: '',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*Vui lòng thử lại';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    print('Saved value: $value');
                                  },
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    ExpirationDateInputFormat()
                                  ],
                                ),
                              ],
                            )),
                            const SizedBox(width: 18),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'CVV/CVC',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 0.12,
                                    letterSpacing: -0.21,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    label: const Text(
                                      'CVV/CVC',
                                      style: TextStyle(
                                        color: Color(0xFFDADADA),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 0.06,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFDADADA),
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFDADADA),
                                        width: 1.0,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEF2E2E),
                                        width: 1.0,
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      color: Color(
                                          0xFFEF2E2E), // Thay đổi màu chữ của thông báo lỗi tại đây
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEF2E2E),
                                        // Màu khi không có focus
                                        width: 1.0,
                                      ),
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    counterText: '',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*Vui lòng thử lại';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    print('Saved value: $value');
                                  },
                                  maxLength: 3,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    // Chỉ cho phép ký tự số
                                  ],
                                ),
                              ],
                            ))
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _isChecked =
                                    !_isChecked; // Chuyển đổi trạng thái khi nhấn
                                print("[New_card]:\t default: $_isChecked");
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  _isChecked
                                      ? 'lib/src/assets/payment/checked.png'
                                      : 'lib/src/assets/payment/unchecked.png',
                                  width: 30,
                                  height: 30,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 60,
                                    color: Colors.white,
                                    child: const Center(
                                      child: Text(
                                        'Đặt làm thẻ mặc định',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          height: 0.06,
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                              widthFactor: 0.85,
                              child: SizedBox(
                                height: 61,
                                child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Xử lý dữ liệu hợp lệ
                                    } else {
                                      print("[New_card]: Dữ liệu không hợp lệ");
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xEED61355),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Thêm thẻ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int count = 0;
    // Lấy toàn bộ văn bản mới
    String input = newValue.text;

    // Tạo chuỗi để thêm dấu ' '
    StringBuffer formatted = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      if (count > 0 && count % 4 == 0) {
        formatted.write(' ');
      }
      formatted.write(input[i]);
      count++; // Chỉ tăng đếm khi gặp ký tự số
    }

    // Trả về giá trị đã định dạng
    return TextEditingValue(
      text: formatted.toString(),
    );
  }
}

class ExpirationDateInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int count = 0;
    // Lấy toàn bộ văn bản mới
    String input = newValue.text;

    // Tạo chuỗi để thêm dấu ' '
    StringBuffer formatted = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      if (count > 0 && count % 2 == 0) {
        formatted.write('/');
      }
      formatted.write(input[i]);
      count++; // Chỉ tăng đếm khi gặp ký tự số
    }

    // Trả về giá trị đã định dạng
    return TextEditingValue(
      text: formatted.toString(),
    );
  }
}
