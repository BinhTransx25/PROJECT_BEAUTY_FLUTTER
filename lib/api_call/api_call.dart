import 'dart:convert';
import 'package:beauty/api_call/notification_helper.dart';
import 'package:http/http.dart' as http;

Future<void> fetchNotifications() async {
  final response = await http.get(
    Uri.parse(
        'https://api-core.dsp.one/api/auth/notify/template?page=1&per_page=2'),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var notifications = data['data'];
    var firstItem = notifications[0];
    NotificationHelper.showNotification(
        firstItem['subject'], firstItem['content']);//nếu chưa sử dụng thư viện thi xoá đi
    print("Notifications: $firstItem");
  } else {
    throw Exception(
        'Failed to load notifications. Status code: ${response.statusCode}');
  }
}
