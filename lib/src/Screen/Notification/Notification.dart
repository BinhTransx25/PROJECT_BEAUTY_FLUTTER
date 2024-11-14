import 'package:beauty/api_call/api_call.dart';
import 'package:beauty/api_call/notification_helper.dart';
import 'package:flutter/material.dart';
import 'widgets/Notification_widget.dart';

class Notification extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<Notification> {
  bool personalInfo = false;
  bool sound = false;
  bool vibration = false;
  bool specialOffers = false;
  bool discounts = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            // Header
            NotificationHeader(title: 'Thông Báo'),
            NotificationDivider(),

            // Option rows with switches
            NotificationOptionRow(
              title: 'Thông tin cá nhân',
              value: personalInfo,
              onChanged: (val) => setState(() => personalInfo = val),
            ),
            NotificationDivider(),
            NotificationOptionRow(
              title: 'Âm thanh',
              value: sound,
              onChanged: (val) => setState(() => sound = val),
            ),
            NotificationDivider(),
            NotificationOptionRow(
              title: 'Rung',
              value: vibration,
              onChanged: (val) => setState(() => vibration = val),
            ),
            NotificationDivider(),
            NotificationOptionRow(
              title: 'Khuyến mãi đặc biệt',
              value: specialOffers,
              onChanged: (val) => setState(() => specialOffers = val),
            ),
            NotificationDivider(),
            NotificationOptionRow(
              title: 'Khuyến mãi và giảm giá',
              value: discounts,
              onChanged: (val) => setState(() => discounts = val),
            ),
            NotificationDivider(),
          ],
        ),
      ),
    );
  }
}
