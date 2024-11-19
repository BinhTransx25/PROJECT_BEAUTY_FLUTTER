import 'package:equatable/equatable.dart';

// Abstract class LoginState
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

// Initial state
class LoginInitial extends LoginState {}

// Loading state (đang tải)
class LoginInProgress extends LoginState {}

// Success state (thành công)
class LoginSuccess extends LoginState {}

// Failure state (thất bại)
class LoginFailure extends LoginState {
  final String error;
  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}


// // lib/blocs/login/login_state.dart
// import 'package:equatable/equatable.dart';

// abstract class LoginState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class LoginInitial extends LoginState {}

// class LoginLoading extends LoginState {}

// class LoginSuccess extends LoginState {
//   final String token;

//   LoginSuccess(this.token);

//   @override
//   List<Object> get props => [token];
// }

// class LoginFailure extends LoginState {
//   final String error;

//   LoginFailure(this.error);

//   @override
//   List<Object> get props => [error];
// }
