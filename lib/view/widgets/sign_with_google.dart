import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/signup/signup_screen.dart';

class SignInWithGoogle extends StatelessWidget {
  final String question;
  final String action;
  final VoidCallback onPressed;

  const SignInWithGoogle({
    super.key,
    required this.question,
    required this.action,
    required this.onPressed,
  });

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope(
      'https://www.googleapis.com/auth/contacts.readonly',
    );
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            Expanded(
              child: Divider(
                color: const Color.fromARGB(158, 255, 255, 255),
                indent: 40,
                endIndent: 10,
                thickness: 1,
                height: 30,
              ),
            ),

            Center(
              child: Text(
                "OR",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),

            Expanded(
              child: Divider(
                color: const Color.fromARGB(158, 255, 255, 255),
                indent: 10,
                endIndent: 40,
                thickness: 1,
                height: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 45,
          width: 300,
          child: ElevatedButton.icon(
            onPressed: () async {
              try {
                await signInWithGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              } catch (e) {
                print("Error in Google Sign-In: $e");
              }
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                const Color.fromARGB(255, 14, 21, 37),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  side: BorderSide(
                    color: const Color.fromARGB(158, 255, 255, 255),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            label: Text(
              "continue with Google",
              style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
            ),
            icon: Image.asset(
              "lib/assets/images/icons8-google-48 (1).png",
              width: 24,
              height: 24,
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(230, 182, 182, 186),
                fontFamily: 'Poppins',
              ),
            ),

            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                action,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontFamily: 'Poppins',
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
