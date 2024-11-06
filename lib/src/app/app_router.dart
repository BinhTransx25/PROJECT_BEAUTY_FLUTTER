// lib/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../Screen/Account/Account.dart';
import '../Screen/FAQs/FAQs.dart';
import '../Screen/Notification/Notification.dart';
// import '../Screen/PersonalInfo/PersonalInfo.dart'; // Import màn hình Thông tin cá nhân
// import '../Screen/PaymentMethods/PaymentMethods.dart'; // Import màn hình Phương thức thanh toán
// import '../Screen/HelpCenter/HelpCenter.dart'; // Import màn hình Trung tâm trợ giúp
// import '../Screen/Login/Login.dart'; // Import màn hình Đăng nhập

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/', // Đây là đường dẫn khởi đầu
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => NotificationScreen(), // Màn hình thông báo
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => AccountScreen(), // Màn hình tài khoản
      ),
       GoRoute(
        path: '/FAQs',
        builder: (context, state) => FAQScreen(), // Màn hình câu hỏi thường gặp
      ),
      /** 
      GoRoute(
        path: '/personal_info',
        builder: (context, state) => PersonalInfoScreen(), // Màn hình thông tin cá nhân
      ),
      GoRoute(
        path: '/payment_methods',
        builder: (context, state) => PaymentMethodsScreen(), // Màn hình phương thức thanh toán
      ),
      GoRoute(
        path: '/help_center',
        builder: (context, state) => HelpCenterScreen(), // Màn hình trung tâm trợ giúp
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(), // Màn hình đăng nhập
      ),
*/

    ],
  );
}
