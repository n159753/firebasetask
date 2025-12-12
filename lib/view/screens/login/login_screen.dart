import 'package:authtask/view/widgets/sign_with_google.dart';
import 'package:flutter/material.dart';
import '../../widgets/text_from_field_widget.dart';
import '../signup/signup_screen.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 21, 37),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                Image.asset(
                  "lib/assets/images/لقطة شاشة 2025-12-11 204954.png",
                  width: 55,
                  height: 55,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
                ),

                Text(
                  "sign in to continue",
                  style: TextStyle(
                    color: const Color.fromARGB(158, 255, 255, 255),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
                LoginForm(),

                SignInWithGoogle(
                  question: "Don't have an account? ",
                  action: 'Sign Up',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
