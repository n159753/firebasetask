import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final IconData? textfielicon;
  final bool isPassword;
  final String label;
  final TextEditingController controler;
  final String hinttxt;
  final Function(String)? onchanged;
  //  final String? Function(String?) validator;
  final String? errorText;
  final String forgotpass;

  const TextFormFieldWidget({
    super.key,
    this.textfielicon,
    this.isPassword = false,
    required this.label,
    required this.controler,
    required this.hinttxt,
    this.onchanged,
    //  required this.validator,
    this.errorText, 
    this.forgotpass ="",
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool obscureTextState = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:MainAxisAlignment.center ,
      spacing: 8,
      children: [
        widget.isPassword
            ? Container(
              width: 300,
              child: Row(             
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(width: 120,),
                    Text(
                      widget.forgotpass,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
            )
            : Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                ],
              ),
            ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
              width: 300,
              child: TextFormField(
                controller: widget.controler,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: widget.isPassword ? obscureTextState : false,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          iconSize: 25,
                          color: const Color.fromARGB(158, 255, 255, 255),
                          onPressed: () {
                            setState(() {
                              obscureTextState = !obscureTextState;
                            });
                          },
                          icon: obscureTextState
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        )
                      : Icon(widget.textfielicon, color: Colors.white, size: 20),
            
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
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
            
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),
            
                validator: (value) {
                  // أولًا الأخطاء اللي جاية من Cubit
                  //
            
                  // ثانيًا التحقق من الحقل الفارغ
                  if (value == null || value.isEmpty) {
                    return "${widget.label} cannot be empty";
                  }
            
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
