
import 'package:authtask/view/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/textformfield_widget.dart';


class LoginForm extends StatefulWidget {

const  LoginForm({super.key,});

  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();



  String? _email;

  String? _password;

  String? emailError;
  
  String? passwordError;


  

   void _submitFormLogin() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
        _email = _emailController.text.trim();
        _password = _passwordController.text.trim();

      await LoginMethod();
                   
    }
  }

  Future<void> LoginMethod() async {
    

    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email!,
    password: _password!,
  );

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login successful: ${credential.user?.email}',
        style: TextStyle(fontSize: 8,fontFamily: 'Poppins'),),
        backgroundColor: Colors.green,
      ),
    );

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),);

} on FirebaseAuthException catch (e) {
  String message;
  if (e.code == 'user-not-found') {
    setState(() {
      emailError='No user found for that email.';
    passwordError=null;
    });
    
  } 
  else if (e.code == 'wrong-password') {
    setState(() {
       passwordError= 'Wrong password provided for that user.';
    emailError=null;
    });
   
  }
  else {
      message = 'Login error: ${e.code}';

      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontSize: 8,fontFamily: 'Poppins'),),
        backgroundColor: Colors.red,));
    }   
}
}


  @override
  Widget build(BuildContext context) {
    return Form(
     key: _formKey, 
      child:Column(
        children: [
          Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             
             TextFormFieldWidget(
               onchanged: (value) {
               _email = value;
             },
               txt: "Email",
               // controller: _emailController,
               hinttxt: 'Enter your email',
               errorText: emailError,
               controler: _emailController,
               ),
                     
            TextFormFieldWidget(
               onchanged: (value) {
               _password = value;
             },
               txt: "Password",
               isPassword: true,
               // controller: _passwordController,
              //  emptyText: "Password is empty ,write your Password",
                hinttxt: 'Enter your password', 
               errorText: passwordError, 
               controler: _passwordController,
           ),         
           ],
          ),
    
    SizedBox(height: 20,),


  ElevatedButton(
    onPressed: () { 
      _submitFormLogin();
      
      print("login is clicked");
    }, 
    style: ElevatedButton.styleFrom(
    minimumSize: Size(300, 45),
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  ),
    ),
    child: Text("Sign In",
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight:FontWeight.bold ),)),
   
         
        ],
      ),  
    
     );
  }
}