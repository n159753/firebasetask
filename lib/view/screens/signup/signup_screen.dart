import 'package:authtask/view/screens/login/login_screen.dart';
import 'package:authtask/view/screens/signup/signup_form.dart';
import 'package:authtask/view/widgets/sign_with_google.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  String? _email;

  String? _password;

  String? __ConfirmPass;

  //  class _SignupScreenState extends State<SignupScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 21, 37),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/images/لقطة شاشة 2025-12-11 204954.png",
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                ),
              ),
              SignupForm(),

              SignInWithGoogle(
                question: "Already have am account? ",
                action: 'Sign In',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
