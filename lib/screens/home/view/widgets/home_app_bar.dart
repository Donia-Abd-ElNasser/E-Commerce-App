
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              int cartCount = 0;
              if (state is CartSuccess) {
                cartCount = state.items.length;
              }
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: -10, end: 5),
                showBadge: cartCount > 0,
                badgeContent: Center(
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.red,
                  elevation: 0,
                ),
                child:
       CircleAvatar(
          backgroundColor: kButtonColor,
          radius: 20,
          child: Center(child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {
              GoRouter.of(context).push(AppRoutes.kCartView);
            },icon: Icon(FontAwesomeIcons.cartShopping,size: 20,color: kPrimaryColor,)),
          ))
            
      
        ));}
        ),
          ],
     ) ,);
  }
}