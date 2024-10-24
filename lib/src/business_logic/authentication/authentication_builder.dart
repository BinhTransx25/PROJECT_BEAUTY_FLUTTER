import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthenticationBuilder extends StatelessWidget {
  final Widget Function(BuildContext, User?) builder;

  const AuthenticationBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Ví dụ với Firebase Auth // Stream lắng nghe thay đổi trạng thái đăng nhập
      builder: (context, snapshot) {
        final user = snapshot.data;
        return builder(context, user);
      },
    );
  }
} 


// Ex:
// AuthenticationBuilder(
//   builder: (context, user) {
//     if (user == null) {
//       return SignInPage(); // Chưa đăng nhập
//     } else {
//       return HomePage(); // Đã đăng nhập
//     }
//   },
// )