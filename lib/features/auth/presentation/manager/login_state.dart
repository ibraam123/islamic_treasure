part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

class LoginPasswordVisibilityChanged extends LoginState {
  final bool isHidden;
  LoginPasswordVisibilityChanged(this.isHidden);
}

class LoginUserTypeChanged extends LoginState {
  final UserType type;
  LoginUserTypeChanged(this.type);
}

