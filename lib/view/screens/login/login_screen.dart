import 'package:authtask/view/widgets/signwithgoogle.dart';
import 'package:flutter/material.dart';
import '../../widgets/textformfield_widget.dart';
import '../signup/signup_screen.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 21, 37),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Text("Welcome Back",style: 
            TextStyle(color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 14,
           ),),

            Text("sign in to continue",style: 
            TextStyle(color: const Color.fromARGB(158, 255, 255, 255),
            fontSize: 14,
            fontFamily: 'Poppins'),),
            LoginForm(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
                  
                children: [
                    Expanded(
                      child: Divider(
                        color: Colors. white,
                        indent: 40,
                        endIndent: 10,
                        thickness: 1,
                        height: 30,
                        ),
                    ),
          
                    
                        Center(
                          child: Text(
                          "OR",
                          style: TextStyle(fontSize: 12,color: Colors. white,fontFamily: 'Poppins'),
                          ),
                        ),
          
                    Expanded(
                      child: Divider(
                        color: Colors. white,
                        indent: 10,
                        endIndent: 40,
                        thickness: 1,
                        height: 30,
                        
                        ),
                    ),
          
                    
                ],
            ),

            SignInWithGoogle(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "Don't have an account?  ",
                    style: TextStyle(fontSize: 10,color: Colors.white,fontFamily: 'Poppins'),
                    ),
                  
                  TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, 
                    minimumSize: Size(0, 0), 
                    
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 10,
                      color: const Color.fromARGB(230, 106, 106, 109),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      
                      
                    ),
                  ),
                  ),                          
              ],
            ),
          ],
        ),
         ), 
    );
  }
}