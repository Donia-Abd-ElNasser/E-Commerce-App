import 'package:ecommerce/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
          color: kwidgetColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(  color: Colors.grey.shade400, 
            spreadRadius: 2, 
            blurRadius: 8, 
            offset: const Offset(0, 4), )
          ]
      ),
    
      height: 100,
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(300),
          child: Image.asset('assets/images/profile.jpg',fit: BoxFit.cover,)),
        
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('title',style: 
                            TextStyle(
                fontSize: 20,
                color: kButtonColor,
                fontWeight: FontWeight.bold,fontFamily: kGtsectrafont,
                            ),),
                            Text('description',style: 
                            TextStyle(
                fontSize: 13,fontFamily: kGtsectrafont,
                color: kButtonColor,
                fontWeight: FontWeight.w600,
                            ),),
                        
                          ],
                        ),
              ),Spacer(),
              CircleAvatar(
               // foregroundColor: kButtonColor,
      backgroundColor: kPrimaryColor,
        radius: 20,
        child: IconButton(
          onPressed: (){},
          icon: Icon( FontAwesomeIcons.solidHeart,color: Colors.red,size: 20,)
        ),
    
          
      )
              ],
            ),
      ),
    );}
}