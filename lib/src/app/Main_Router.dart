// main_router.dart

import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Signin.dart';
import 'package:beauty/src/Screen/Onboarding_Signin_up_Splash/Signup.dart';

import '../Screen/Onboarding_Signin_up_Splash/splash_widget.dart';
// main_router.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'Authentication_router/Authen_router.dart';
import 'Authorization_router/Author_router.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../bloc/login_bloc/login_state.dart';
import '../bloc/BlocRefreshNotifier.dart';
import 'package:flutter/material.dart';


class MainRouter {
  final LoginBloc loginBloc;

  MainRouter({required this.loginBloc});

  late final GoRouter router = GoRouter(
    initialLocation: '/signin', // Định nghĩa location ban đầu
    refreshListenable: BlocRefreshNotifier(loginBloc),
    routes: [
      GoRoute(
        path: '/signin',
        builder: (context, state) => SigninScreen(),
      ),
      // Kết hợp các routes từ AuthenRouter
      ...AuthenRouter.routes,
      // Kết hợp các routes từ AuthorRouter
      ...AuthorRouter.routes,
    ],
    redirect: (context, state) {
      final loginState = context.read<LoginBloc>().state;

      // Điều hướng dựa trên trạng thái đăng nhập
      if ((loginState is LoginInitial || loginState is LoginFailure) &&
          state.uri.toString() == '/account') {
        // Khi ở trạng thái LoginInitial hoặc LoginFailure, chuyển về trang đăng nhập
        return '/signin';
      }

      if (loginState is LoginSuccess && state.uri.toString() == '/signin') {
        // Nếu đã đăng nhập thành công, chuyển tới trang home
        return '/home';
      }
      return null; // Không thay đổi trang nếu không có điều kiện nào khớp
    },
  );
}
