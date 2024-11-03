// // lib/screens/login_screen.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/login/login_bloc.dart';
// import '../blocs/login/login_event.dart';
// import '../blocs/login/login_state.dart';
// import '../services/api_client.dart';
// import 'home_screen.dart';
// import 'package:dio/dio.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: BlocProvider(
//         create: (context) => LoginBloc(ApiClient(Dio())),
//         child: BlocListener<LoginBloc, LoginState>(
//           listener: (context, state) {
//             if (state is LoginSuccess) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             } else if (state is LoginFailure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.error)),
//               );
//             }
//           },
//           child: BlocBuilder<LoginBloc, LoginState>(
//             builder: (context, state) {
//               if (state is LoginLoading) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     TextField(
//                       controller: emailController,
//                       decoration: InputDecoration(labelText: 'Email'),
//                     ),
//                     TextField(
//                       controller: passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(labelText: 'Password'),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         BlocProvider.of<LoginBloc>(context).add(
//                           LoginButtonPressed(
//                             email: emailController.text,
//                             password: passwordController.text,
//                           ),
//                         );
//                       },
//                       child: Text('Login'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
