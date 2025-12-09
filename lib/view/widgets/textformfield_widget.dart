import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatefulWidget {
 final IconData?  textfielicon;
 final bool isPassword;
 final String txt;
 final TextEditingController controler;
 final String hinttxt;
final Function(String)? onchanged;
//  final String? Function(String?) validator;
 final String? errorText;



 

  const TextFormFieldWidget({
    super.key,
    this.textfielicon,
    this.isPassword = false, 
    required this.txt, 
    required this.controler, 
    required this.hinttxt, 
     this.onchanged, 
    //  required this.validator, 
     this.errorText, 
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool obscureTextState=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Text(widget.txt,
        style: TextStyle(fontSize: 12,color: Colors.white, fontFamily: 'Poppins',),
        ),

        SizedBox(
          height: 55,
          width: double.infinity,
          child: TextFormField(
            // controller:widget.controler,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText:widget.isPassword ? obscureTextState : false,
            style: TextStyle(fontSize: 12,color: Colors.white, fontFamily: 'Poppins',),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(91, 22, 45, 83),
            errorStyle: TextStyle(
            fontSize: 7, 
            color: Colors.red, 
            fontWeight: FontWeight.bold, 
             fontFamily: 'Poppins',
          ),
          errorText: widget.errorText,
          hintText: widget.hinttxt,
          hintStyle: TextStyle(
            fontSize: 12, 
             fontFamily: 'Poppins',
            color: const Color.fromARGB(158, 255, 255, 255), 
            // fontWeight: FontWeight.bold, 
          ),
            suffixIcon: 
            widget.isPassword 
            ? IconButton(
              iconSize: 25,
              color: const Color.fromARGB(158, 255, 255, 255),
              onPressed: (){setState(() {
                obscureTextState = !obscureTextState;
              });},
                icon: obscureTextState ? Icon(Icons.visibility_off): Icon(Icons.visibility))  
                : Icon(
                   widget.textfielicon,
                  color: Colors.white,
                  size: 20,
                ),         
                
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(162, 35, 78, 148),
                  width: 1,
                ),               
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color.fromARGB(108, 255, 255, 255),
                  width: 2,
                ),  
              ),

              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),                           
              ),
              validator: (value) {
                if (widget.errorText != null) return widget.errorText;
                if (value == null || value.isEmpty) return "$widget.txt cannot be empty";
                return null;
              }

              ),
          ),
      ],
    );
  }
}

