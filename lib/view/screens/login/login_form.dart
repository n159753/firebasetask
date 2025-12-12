import 'package:authtask/controller/login_cubit/login_cubit.dart';
import 'package:authtask/controller/login_cubit/login_cubit.dart';
import 'package:authtask/view/screens/home_screen.dart';
import 'package:authtask/view/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/text_from_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? emailErrors;
  String? passwordErrors;

    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is LoginError) {
            setState(() {
              emailErrors = state.emailError;
              passwordErrors = state.passwordError;
            });

            if (state.message != null && state.message!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message!,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },

        builder: (context, state) {
          String? emailError;
          String? passwordError;

          if (state is LoginError) {
            emailError = state.emailError;
            passwordError = state.passwordError;
          }
          return Form(
            key: _formKey,
            child: Column(
              spacing: 10,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    TextFormFieldWidget(
                      label: "Email",
                      hinttxt: 'Enter your email',
                      errorText: emailError,
                      controler: _emailController,
                    ),

                    TextFormFieldWidget(
                      label: "Password",
                      isPassword: true,
                      hinttxt: 'Enter your password',
                      errorText: passwordError,
                      controler: _passwordController,
                      forgotpass: "forgot password?",
                    ),
                  ],
                ),

                state is LoginLoading
                    ? const CircularProgressIndicator()
                    : ButtonWidget(
                      formKey: _formKey, 
                      emailController: _emailController, 
                      passwordController: _passwordController, 
                      btntxt:"Sign In",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                    
                        }
                    
                    },),
              ],
            ),
          );
        },
      ),
    );
  }
}




