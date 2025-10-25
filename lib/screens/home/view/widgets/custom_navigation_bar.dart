import 'package:badges/badges.dart' as badges;
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_state.dart';
import 'package:ecommerce/screens/favourite/view_model/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: kButtonColor,
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Opacity(
            opacity: 0.7,

            child: IconButton(
              iconSize: 25,
              color: kPrimaryColor,
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kHomeView);
              },
              icon: Center(child: Icon(FontAwesomeIcons.house)),
            ),
          ),
          BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              int favCount = 0;
              if (state is FavSuccess) {
                favCount = state.items.length;
              }
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 5, end: 5),
                showBadge: favCount > 0,
                badgeContent: Center(
                  child: Text(
                    favCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.red,
                  elevation: 0,
                ),
                child: Opacity(
                opacity: 0.7,

                child: IconButton(
                  iconSize: 22,
                  color: kPrimaryColor,
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kFavouriteView);
                  },
                  icon: Center(child: Icon(FontAwesomeIcons.heart)),
                ),
              ),);
            },
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              int cartCount = 0;
              if (state is CartSuccess) {
                cartCount = state.items.length;
              }
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 5, end: 5),
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
                child: Opacity(
                  opacity: 0.7,

                  child: IconButton(
                    iconSize: 25,
                    color: kPrimaryColor,
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kCartView);
                    },
                    icon: Center(child: Icon(FontAwesomeIcons.cartShopping)),
                  ),
                ),
              );
            },
          ),

          Opacity(
            opacity: 0.7,

            child: IconButton(
              iconSize: 30,
              color: kPrimaryColor,
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kProfileView);
              },
              icon: Center(child: Icon(Icons.person)),
            ),
          ),
        ],
      ),
    );
  }
}
