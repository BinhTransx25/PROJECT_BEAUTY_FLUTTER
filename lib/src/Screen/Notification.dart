import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Define the switch states for each option
  bool personalInfo = false;
  bool sound = false;
  bool vibration = false;
  bool specialOffers = false;
  bool discounts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            const Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 24),
                  const Expanded(
                    child: Text(
                      'Thông Báo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Color(0xFFD9D9D9)),

            // Option rows with toggles
            _buildOptionRow(
              title: 'Thông tin cá nhân',
              value: personalInfo,
              onChanged: (val) {
                setState(() {
                  personalInfo = val;
                });
              },
            ),
            _buildDivider(),

            _buildOptionRow(
              title: 'Âm thanh',
              value: sound,
              onChanged: (val) {
                setState(() {
                  sound = val;
                });
              },
            ),
            _buildDivider(),

            _buildOptionRow(
              title: 'Rung',
              value: vibration,
              onChanged: (val) {
                setState(() {
                  vibration = val;
                });
              },
            ),
            _buildDivider(),

            _buildOptionRow(
              title: 'Khuyến mãi đặc biệt',
              value: specialOffers,
              onChanged: (val) {
                setState(() {
                  specialOffers = val;
                });
              },
            ),
            _buildDivider(),

            _buildOptionRow(
              title: 'Khuyến mãi và giảm giá',
              value: discounts,
              onChanged: (val) {
                setState(() {
                  discounts = val;
                });
              },
            ),
            _buildDivider(),
          ],
        ),
      ),
    );
  }

  // Widget for each row with a switch
  Widget _buildOptionRow(
      {required String title,
      required bool value,
      required Function(bool) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Color.fromARGB(255, 0, 0, 0),
            inactiveThumbColor: Color.fromARGB(255, 224, 224, 224),
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }

  // Widget for divider with custom padding
  Widget _buildDivider() {
    return Divider(
      color: Color(0xFFD9D9D9),
      thickness: 2,
    );
  }
}
