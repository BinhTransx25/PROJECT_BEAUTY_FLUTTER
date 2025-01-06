import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';

// import 'src/service/api_client.dart';
// import 'src/bloc/auth/auth_bloc.dart';
// import 'src/repositories/auth_repository.dart';
// import 'notification_helper/notification_helper.dart';

import 'src/app/main_router.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MainRouter _mainRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _mainRouter.router,
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize notification helper
//   await NotificationHelper.init();

//   // Initialize Dio and ApiClient
//   final dio = Dio();
//   final apiClient = ApiClient(dio);

//   // Initialize AuthRepository
//   final authRepository = AuthRepository(apiClient);

//   // Run the app
//   runApp(MyApp(authRepository: authRepository));
// }

// class MyApp extends StatelessWidget {
//   final AuthRepository authRepository;

//   const MyApp({Key? key, required this.authRepository}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => AuthBloc(authRepository),
//         ),
//       ],
//       child: Builder(
//         builder: (context) {
//           final authBloc = context.read<AuthBloc>();
//           final router = MainRouter(authBloc: authBloc).router;

//           return MaterialApp.router(
//             routerConfig: router,
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter App',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//               visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }