// lib/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../Screen//Account//Account.dart';
import '../Screen//FAQs/FAQs.dart';
import '../Screen//Notification/Notification.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/', // Đây là đường dẫn khởi đầu
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            NotificationScreen(), // Màn hình sẽ hiển thị
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => AccountScreen(),
      ),
      GoRoute(
        path: '/FAQs',
        builder: (context, state) => FAQScreen(),
      ),
    ],
  );
}
