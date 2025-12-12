part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String? userEmail;
  LoginSuccess({this.userEmail});
}

final class LoginError extends LoginState {
  final String? message;
  final String? passwordError;
  final String? emailError;
  LoginError({this.message, this.passwordError, this.emailError});
}
