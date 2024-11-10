import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEvent {
  final String username;
  final String password;

  LoginRequested({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class LogoutRequested extends LoginEvent {}




// // lib/blocs/login/login_event.dart
// import 'package:equatable/equatable.dart';

// abstract class LoginEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class LoginButtonPressed extends LoginEvent {
//   final String email;
//   final String password;

//   LoginButtonPressed({required this.email, required this.password});

//   @override
//   List<Object> get props => [email, password];
// }
