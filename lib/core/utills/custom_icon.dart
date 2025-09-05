import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: kButtonColor,
        radius: 20,
        child: Icon(icon,color: kPrimaryColor,size: 20,)
          
    
      );
  }
}