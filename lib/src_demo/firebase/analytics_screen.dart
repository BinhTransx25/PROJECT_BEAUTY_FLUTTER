import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsScreen extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Analytics'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Ghi nhận sự kiện
            analytics.logEvent(
              name: 'test_event',
              parameters: <String, Object>{
                'string': 'test',
                'int': 123,
              },
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Event logged!')),
            );
          },
          child: const Text('Log Event'),
        ),
      ),
    );
  }
}
