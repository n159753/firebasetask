import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(LoginSuccess(userEmail: credential.user?.email ?? ""));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(emailError: '${e.code}'));
    } catch (e) {
      emit(LoginError(message: 'Unexpected error: $e'));
    }
  }
}
