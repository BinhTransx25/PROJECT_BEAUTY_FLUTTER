// main_router.dart

import '../Screen/Onboarding_Signin_up_Splash/splash_widget.dart';

// main_router.dart
// import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:go_router/go_router.dart';
import 'Authentication_router/Authen_router.dart';
import 'Authorization_router/Author_router.dart';


// import '../bloc/login_bloc/login_bloc.dart';
// import '../bloc/login_bloc/login_state.dart';
// import '../bloc/BlocRefreshNotifier.dart';

// import '../bloc/auth/auth_bloc.dart';
// import '../bloc/auth/auth_state.dart';


class MainRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/splash', // Màn hình mặc định khi mở ứng dụng
    routes: [
      GoRoute(
       path: '/splash',
       builder: (context, state) => SplashWidget(),
      ),
      ...AuthenRouter.routes,
      ...AuthorRouter.routes,
    ],
    redirect: (context, state) {
      // Thêm logic điều hướng nếu cần
      return null;
    },
  );
}

// class MainRouter {
//   // final LoginBloc loginBloc;
//   final AuthBloc authBloc;

//   MainRouter({required this.authBloc});

//   late final GoRouter router = GoRouter(
//     initialLocation: '/splash', // Định nghĩa location ban đầu
//     refreshListenable: BlocRefreshNotifier(authBloc),
//     routes: [
//       GoRoute(
//         path: '/splash',
//         builder: (context, state) => SplashWidget(),
//       ),
//       // Kết hợp các routes từ AuthenRouter
//       ...AuthenRouter.routes,
//       // Kết hợp các routes từ AuthorRouter
//       ...AuthorRouter.routes,
//     ],
//     redirect: (context, state) {
//       final authBloc = context.read<AuthBloc>().state;

//       // Điều hướng dựa trên trạng thái đăng nhập
//       if ((authBloc is LoginInitial || authBloc is LoginFailure) &&
//           state.uri.toString() == '/account') {
//         // Khi ở trạng thái LoginInitial hoặc LoginFailure, chuyển về trang đăng nhập
//         return '/signin';
//       }

//       if (authBloc is LoginSuccess && state.uri.toString() == '/signin' && state.uri.toString() == '/splash' ) {
//         // Nếu đã đăng nhập thành công, chuyển tới trang home
//         return '/home';
//       }
//       return null; // Không thay đổi trang nếu không có điều kiện nào khớp
//     },
//   );
// }


