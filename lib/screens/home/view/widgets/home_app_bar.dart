
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key,  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          CircleAvatar(
          backgroundColor: kButtonColor,
          radius: 20,
          child: Center(child: Padding(
            padding: const EdgeInsets.only(right: 3.0,bottom: 3),
            child: Icon(FontAwesomeIcons.house,color: kPrimaryColor,size: 20,),
          ))
            
      
        ),
        Text('Home',style: TextStyle(color: kButtonColor,fontSize: 22,fontWeight: FontWeight.bold),),
      
       CircleAvatar(
          backgroundColor: kButtonColor,
          radius: 20,
          child: Center(child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {
              GoRouter.of(context).push(AppRoutes.kCartView);
            },icon: Icon(FontAwesomeIcons.cartShopping,size: 20,color: kPrimaryColor,)),
          ))
            
      
        ),
          ],
     ) ,);
  }
}