
import 'package:go_router/go_router.dart';

import '../../Screen/Cart/Cart.dart';
import '../../Screen/Account/Account.dart';
import '../../Screen/Shop/NotificationScreen.dart';
import '../../Screen/Find/find.dart';
import '../../Screen/Find/filter.dart';
import '../../Screen/Favourite/favorite_product.dart';
import '../../Screen/CheckOut/Checkout.dart';
import '../../Screen/Address/Address.dart';
import '../../Screen/Address/Edit_Address.dart';
import '../../Screen/Vouchers/Vouchers.dart';
import '../../Screen/Profile/Profile.dart';
import '../../Screen/Payment_method/payment_method.dart';
import '../../Screen/NewCard/new_card.dart';
import '../../Screen/Notification/Notification.dart';
import '../../Screen/FAQs/FAQs.dart';
import '../../Screen/Help_Center/Help_Center.dart';
import '../../Screen/Home/HomeScreen.dart';

class AuthorRouter {
  static final List<GoRoute> routes = [
     GoRoute(
      path: '/help_center',
      builder: (context, state) => HelpCenterScreen(),
    ),
    GoRoute(
      path: '/FAQs',
      builder: (context, state) => FAQScreen(),
    ),
    GoRoute(
      path: '/notification_account',
      builder: (context, state) => Notification(),
    ),
     GoRoute(
      path: '/newcard',
      builder: (context, state) => NewCard(),
    ),
    GoRoute(
      path: '/paymentmethod',
      builder: (context, state) => PaymentMethod(),
    ),
   GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/voucher',
      builder: (context, state) => VouchersScreen(),
    ),
    GoRoute(
      path: '/editaddress',
      builder: (context, state) => EditAddressScreen(),
    ),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => CheckoutScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/favourite',
      builder: (context, state) => FavoriteProduct(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartScreen(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => AccountScreen(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => AddressScreen(),
    ),
     GoRoute(
      path: '/notification',
      builder: (context, state) => NotificationScreen(),
    ),
     GoRoute(
      path: '/find',
      builder: (context, state) => Find(),
    ),
    GoRoute(
      path: '/filter',
      builder: (context, state) => Filter(),
    ),
    
  ];
}
