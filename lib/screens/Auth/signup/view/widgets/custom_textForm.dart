import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';


class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {super.key, this.obscureText = false, this.onChange, required this.text, required this.controller, required this.icon});
  Function(String)? onChange;
  final String text;
  final bool? obscureText;
  final Icon icon;
  
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return '$text is required';
        }
        return null;
      },
      onChanged: onChange,
       decoration: InputDecoration(
        errorStyle:TextStyle(color: kButtonColor,) ,
       labelStyle: TextStyle(color: kButtonColor,),
                      labelText: text,
                   
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kButtonColor),
                         borderRadius: BorderRadius.circular(25.0),
                      ) ,
                       focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: kButtonColor),
                         borderRadius: BorderRadius.circular(25.0),
                      ) ,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
    ),
    );
  }
}