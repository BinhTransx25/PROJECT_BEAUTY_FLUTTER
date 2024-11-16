import 'package:beauty/logic/get_notify/get_notify_block.dart';
import 'package:flutter/material.dart';

// import 'src/Screen/Password_Recovery_Reset/VerificationCode.dart';
// import 'src/app/app_router.dart';
import 'notification_helper/notification_helper.dart';
import 'src/app/Main_Router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/bloc/login_bloc/login_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) =>
              GetNotifyBloc(), // Make sure GetNotifyBloc is defined
        ),
      ],
      child: Builder(
        builder: (context) {
          final loginBloc = context.read<LoginBloc>();
          final router = MainRouter(loginBloc: loginBloc).router;
          return MaterialApp.router(
            routerConfig: router,
          );
        },
      ),
    );
  }
}

/**
    class MyApp extends StatelessWidget {
    final _appRouter = AppRouter();
    @override
    Widget build(BuildContext context) {
    return MaterialApp.router(
    // home: HomeScreennnn(),  Gọi màn hình mọi người đang code vào đây nha
    routerConfig: _appRouter.router,

    );
    }
    }
 */

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Verificationcode(), // Gọi màn hình mọi người đang code vào đây nha
//     );
//   }
// }
