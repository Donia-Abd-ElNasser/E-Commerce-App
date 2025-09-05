import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.only(top: 16,left: 16,bottom: 5),
  child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),),
);
  }
}