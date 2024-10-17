import 'package:firebase_analytics/firebase_analytics.dart';


class FirebaseAnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logEvent(String eventName) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: {'value': 1},
    );
  }
}

