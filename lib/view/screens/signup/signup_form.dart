// import 'package:firebase_auth/firebase_auth.dart';
import 'package:authtask/controller/signup_cubit/signup_cubit.dart';
import 'package:authtask/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_from_field_widget.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Sign Up successful: ${state.userEmail}',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  backgroundColor: Colors.green,
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            } else if (state is SignupError) {
              setState(() {
                emailErrors = state.emailError;
                passwordErrors = state.passwordError;
              });

              if (state.message != null && state.message!.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message!,
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  TextFormFieldWidget(
                    label: "Email",
                    hinttxt: 'Enter your email',
                    errorText: emailErrors,
                    controler: _emailController,
                  ),

                  TextFormFieldWidget(
                    label: "Password",
                    isPassword: true,
                    hinttxt: 'Enter your password',
                    errorText: passwordErrors,
                    controler: _passwordController,
                  ),

                  state is SignupLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<SignUpCubit>(context).signUp(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 45),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
