import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'src/service/api_client.dart';
import 'src/bloc/auth/auth_bloc.dart';
import 'package:beauty/logic/get_notify/get_notify_block.dart';
import 'notification_helper/notification_helper.dart';
import 'src/app/main_router.dart';

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
          create: (context) => AuthBloc(apiClient: apiClient()),
        ),
        BlocProvider(
          create: (context) => GetNotifyBloc(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final authBloc = context.read<AuthBloc>();
          final router = MainRouter(authBloc: authBloc).router;

          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            title: 'Beauty App',
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        },
      ),
    );
  }

  ApiClient apiClient() {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: "http://10.0.2.2:41754",
    );
    return ApiClient(dio);
  }
}
