import 'package:equatable/equatable.dart';
import '../../models/user/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess(this.user);
}
class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
