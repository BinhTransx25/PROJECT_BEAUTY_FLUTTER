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
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Spacer(),
                  Text(
                    'Trung tâm trợ giúp',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
            
            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(
                color: Color(0xFFD9D9D9),
                thickness: 2,
              ),
            ),
            
            // Section "Hôm nay"
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12),
              ),
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
            
            // Left bubble message 1
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: 161,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Là dị đó :V',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
            
            // Left bubble message 2
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: 161,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Là dị đó :V',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
            
            // Timestamp
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '10:42 pm',
                  style: TextStyle(fontSize: 10, color: Color(0xFF95989A)),
                ),
              ),
            ),
            
            // Right bubble message
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: 161,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Là dị đó :V',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ),
            
            // Right timestamp
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '10:42 pm',
                style: TextStyle(fontSize: 10, color: Color(0xFF95989A)),
              ),
            ),
            
            Spacer(),
            
            // Message input field
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 45,
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
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.send, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
