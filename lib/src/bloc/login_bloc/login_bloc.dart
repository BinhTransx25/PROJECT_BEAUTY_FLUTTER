// // lib/blocs/login/login_bloc.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'login_event.dart';
// import 'login_state.dart';
// import '../../services/api_client.dart';
// import 'package:dio/dio.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final ApiClient apiClient;

//   LoginBloc(this.apiClient) : super(LoginInitial()) {
//     on<LoginButtonPressed>((event, emit) async {
//       emit(LoginLoading());
//       try {
//         final response = await apiClient.login({
//           'email': event.email,
//           'password': event.password,
//         });
//         emit(LoginSuccess(response.token));
//       } catch (e) {
//         emit(LoginFailure('Login failed'));
//       }
//     });
//   }
// }
