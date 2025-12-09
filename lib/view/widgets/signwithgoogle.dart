import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({
    super.key,
  });


Future<UserCredential> signInWithGoogle() async {
  
  // Create a new provider
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  googleProvider.setCustomParameters({
    'login_hint': 'user@example.com'
  });

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
    
             ElevatedButton.icon(
                onPressed: () async  {
              try {
                await signInWithGoogle(); 
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()), 
                );
              } catch (e) {
                print("Error in Google Sign-In: $e");
              }
            },label:Text("continue with Google",style: TextStyle(fontFamily: 'Poppins',color: Colors.black),),
            icon: Image.asset("lib/consts/images/icons8-google-48 (1).png"),),
          
      ],
    );
  }
}