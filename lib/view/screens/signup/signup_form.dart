// import 'package:firebase_auth/firebase_auth.dart';
import 'package:authtask/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/textformfield_widget.dart';


class SignupForm extends StatefulWidget {

const SignupForm({super.key,});

  @override
  State<SignupForm> createState() => _SignupFormState();
}
class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
// final TextEditingController _confirmpasswordController = TextEditingController();



  String? _email;

  String? _password;

    // String? _ConfirmPass;

    String? emailErrors;
  
  String? passwordErrors;
  // String?confirmpasswordErrors;



   void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();

    // print("isValid = $isValid");
    if (isValid) {
      _formKey.currentState!.save();
        _email = _emailController.text.trim();
        _password = _passwordController.text.trim();
   
//    if (_password != _ConfirmPass) {
//   setState(() {
//     confirmpasswordErrors = 'Passwords do not match!';
//   });
//   return;
// } else {
//   setState(() {
//     confirmpasswordErrors = null;
//   });
// }

      await signUpMethod();
                   
    }
  }

  Future<void> signUpMethod() async {
    
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:_email!,
    password: _password!,
  );

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sign Up successful: ${credential.user?.email}',style: TextStyle(fontFamily: 'Poppins'),),
        backgroundColor: Colors.green,
      ),
    );

  Navigator.pushReplacement(
       context,
        MaterialPageRoute(builder: (context) =>HomeScreen()));
} on FirebaseAuthException catch (e) {
String message;
  if (e.code == 'weak-password') {
    setState(() {
      passwordErrors = 'The password provided is too weak.';
    });
   
  } else if (e.code == 'email-already-in-use') {
    setState(() {
       emailErrors = 'The account already exists for that email.';
    });
   
  }
  else if (e.code == 'invalid-email') {
    setState(() {
      emailErrors = 'Invalid email address.';

    });
      
    }
    else if (e.code == 'operation-not-allowed') {
      message = 'Sign-up method not allowed.';
    } 
    else {
      message = 'Signup error: ${e.code}';
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontSize: 8,fontFamily: 'Poppins'),),
        backgroundColor: Colors.red,));
}
    }

     catch (e) {
  print(e);
}
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
           child: Form(
            key: _formKey, 
             child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormFieldWidget(
               onchanged: (value) {
               _email = value;
             },
               txt: "Email", 
               hinttxt: 'Enter your email',
               errorText: emailErrors, 
               controler: _emailController,
               ),
                     
            TextFormFieldWidget(
               onchanged: (value) {
               _password = value;
             },
               txt: "Password",
               isPassword: true,
                hinttxt: 'Enter your password', 
                errorText: passwordErrors, 
                controler: _passwordController,
           ),  
           
          //      TextFormFieldWidget(
          //      onchanged: (value) {
          //     _ConfirmPass = value;
          //    },
          //      txt: "Confirm Password",
          //      isPassword: true,
          //       hinttxt: 'Enter your password', 
          //       errorText: confirmpasswordErrors, 
          //       controler: _confirmpasswordController,
          //  ),  
           
               

              SizedBox(height: 10,),

              ElevatedButton(
                onPressed: () { 
                  _submitFormOnRegister();
                  
                  
                }, 
                style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 45),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
                ),
                child: Text("Sign Up",
                style: TextStyle(
                   fontFamily: 'Poppins',
                  color: Colors.white),)),

            SizedBox(height: 8,),

              
              ],
             ),   
               ),
         );
  }
}