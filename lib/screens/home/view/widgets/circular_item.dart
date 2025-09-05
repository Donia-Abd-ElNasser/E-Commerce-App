import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';

class CircularItem extends StatelessWidget {
  const CircularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    //  width: 100,
    margin: EdgeInsets.only(right: 4,),
    padding: EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(
        color:kButtonColor,
        borderRadius: BorderRadius.circular(25),
        
      ),
      child: Center(child: Text('mussicccccccccc',style: TextStyle(fontSize: 16,color: kPrimaryColor))),
    );

  }
}