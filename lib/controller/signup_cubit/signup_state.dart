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
  final String? message; 
  final String? emailError; 
  final String? passwordError; 

  SignupError({this.message, this.emailError, this.passwordError});
}
