import 'package:flutter/material.dart';

class CustomerServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Spacer(),
                  Text(
                    'Hỗ Trợ Khách Hàng',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: Color(0xFFD9D9D9),
                thickness: 2,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 135.0),
              // Section "Hôm nay"
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                child: Center(
                  child: Text(
                    'Hôm nay',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            // Left bubble message 1
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Là dị đó :V',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Left bubble message 2
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Là dị đó :V',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Timestamp
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 5),
                child: Text(
                  '10:42 pm',
                  style: TextStyle(fontSize: 12, color: Color(0xFF95989A)),
                ),
              ),
            ),

            // Right bubble message
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 5),
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Là dị đó :V',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            // Right timestamp
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '10:42 pm',
                style: TextStyle(fontSize: 11, color: Color(0xFF95989A)),
              ),
            ),

            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              // Message input field
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Viết tin nhắn của bạn',
                          hintStyle: TextStyle(color: Color(0xFFD9D9D9)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: Icon(Icons.send, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
