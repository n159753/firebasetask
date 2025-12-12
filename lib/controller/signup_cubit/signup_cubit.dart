import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  SignUpCubit() : super(SignupInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(SignupLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(SignupSuccess(userEmail: credential.user?.email ?? ""));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupError(passwordError: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignupError(emailError: 'The account already exists for that email.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(SignupError(emailError: 'Invalid email address.'));
      } else if (e.code == 'operation-not-allowed') {
        emit(SignupError(message: 'Sign-up method not allowed.'));
      } else {
        emit(SignupError(message: 'Sign-up error: ${e.message ?? e.code}'));
      }
    } catch (e) {
      emit(SignupError(message: 'Unexpected error: $e'));
    }
  }
}
