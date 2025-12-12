import 'package:authtask/controller/login_cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.btntxt,
     GlobalKey<FormState>? formKey,
     TextEditingController? emailController,
     TextEditingController? passwordController,
  }) : _formKey = formKey, _emailController = emailController, _passwordController = passwordController;

  final GlobalKey<FormState>? _formKey;
  final TextEditingController? _emailController;
  final TextEditingController? _passwordController;
  
  final VoidCallback onPressed;
  
  final String btntxt;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
    
        style: ElevatedButton.styleFrom(
          minimumSize: Size(300, 45),
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        child: Text(
          btntxt,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
      );
  }
}