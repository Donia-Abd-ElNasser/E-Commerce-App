import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';

class CircularItem extends StatelessWidget {
  const CircularItem({super.key});

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
        width: 100,
      margin: EdgeInsets.only(right: 4,),
      padding: EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          color:kButtonColor,
          borderRadius: BorderRadius.circular(100),
        image:DecorationImage(image:AssetImage('assets/images/profile.jpg',),fit: BoxFit.cover, )   
        ),
        
      ),
      SizedBox(height: 10,),
        Expanded(child: Center(child: Text('mussiccccc',style: TextStyle(fontSize: 18,color: kButtonColor))))
      ],
      ),
    );

  }
}

