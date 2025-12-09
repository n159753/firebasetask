import 'package:authtask/view/screens/login/login_screen.dart';
import 'package:authtask/view/screens/signup/signup_form.dart';
import 'package:authtask/view/widgets/signwithgoogle.dart';
import 'package:flutter/material.dart';
class SignupScreen extends StatelessWidget {

 SignupScreen({super.key,});

  final _formKey = GlobalKey<FormState>();

  String? _email;

  String? _password;

  String? __ConfirmPass;

//  class _SignupScreenState extends State<SignupScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

         
          SignupForm(),
           SignInWithGoogle(),
          
          Spacer(flex: 1,),
          
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "Already have an account?  ",
                    style: TextStyle(fontSize: 10,color: Colors.white,fontFamily: 'Poppins',),
                    ),
                  
                  TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, 
                    minimumSize: Size(0, 0), 
                    
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      color: const Color.fromARGB(230, 106, 106, 109),
                      fontWeight: FontWeight.bold,
                      
                      
                    ),
                  ),
                  ),                          
              ],
            ),
         Spacer(flex: 1,)

        ],
       ),
     ),
    );

      
  }
}