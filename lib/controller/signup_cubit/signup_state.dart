part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final String userEmail;
  SignupSuccess({required this.userEmail});
}

final class SignupError extends SignupState {
  final String? message; // رسالة عامة تظهر SnackBar
  final String? emailError; // يظهر تحت TextFormField
  final String? passwordError; // يظهر تحت TextFormField

  SignupError({this.message, this.emailError, this.passwordError});
}
