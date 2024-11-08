import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  bool isSMSChecked = true;
  bool isEmailChecked = false;

  void handleSMSCheck() {
    setState(() {
      isSMSChecked = true;
      isEmailChecked = false;
    });
  }

  void handleEmailCheck() {
    setState(() {
      isSMSChecked = false;
      isEmailChecked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'lib/src/assets/PasswordRecovery/bk.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.only(bottom: 40),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width, // Đảm bảo Container chiếm toàn bộ chiều rộng màn hình
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 150, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset('lib/src/assets/PasswordRecovery/avatar.png', width: 90, height: 90),
                    ),
                  ),
                  const Text(
                    'Đặt lại mật khẩu',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Vui lòng lựa chọn phương thức của bạn.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF979797)),
                  ),
                  const SizedBox(height: 57),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: handleSMSCheck,
                          child: Container(
                            width: 200,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: isSMSChecked ? const Color(0xFFF7D0DD) : const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SMS',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: isSMSChecked ? const Color(0xFFD61355) : Colors.black,
                                    fontWeight: isSMSChecked ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: isSMSChecked? const Color(0xFFD61355): const Color(0xFFD2D2D2),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: Center(
                                    child: isSMSChecked ? Image.asset('lib/src/assets/PasswordRecovery/check.png'):null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: handleEmailCheck,
                          child: Container(
                            width: 200,
                            height: 40,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: isEmailChecked ? const Color(0xFFF7D0DD) : const Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: isEmailChecked ? const Color(0xFFD61355) : Colors.black,
                                    fontWeight: isEmailChecked ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: isEmailChecked? const Color(0xFFD61355): const Color(0xFFD2D2D2),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: Center(
                                    child: isEmailChecked ? Image.asset('lib/src/assets/PasswordRecovery/check.png'):null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Xử lý sự kiện xác nhận
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD61355),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Xác nhận',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Xử lý khi người dùng nhấn vào nút
                    },
                    child: const Text('Trở về', style: TextStyle(color: Color(0xff202020), fontSize: 16)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
