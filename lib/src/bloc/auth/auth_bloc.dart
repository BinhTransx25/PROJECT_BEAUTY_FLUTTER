// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../repositories/auth_repository.dart';

// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//     final AuthRepository authRepository;

//   AuthBloc(this.authRepository) : super(AuthInitial()) {
//     on<LoginEvent>((event, emit) async {
//       emit(AuthLoading());
//       try {
//         final user = await authRepository.login(
//            event.email,
//            event.password
//         );
//         emit(AuthSuccess(user));
//       } catch (e) {
//         emit(AuthFailure("Login failed: $e"));
//       }
//     });
//   }
// }
