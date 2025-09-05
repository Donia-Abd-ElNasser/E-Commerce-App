
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/favourite/view/widgets/fav_app_bar.dart';
import 'package:ecommerce/screens/favourite/view/widgets/fav_card.dart';
import 'package:flutter/material.dart';


class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: kPrimaryColor,
        bottom:  PreferredSize(preferredSize: const Size.fromHeight(20), child: Padding(
        padding: const EdgeInsets.all(16),
        child: FavAppBar()
      ),),),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          
          itemBuilder: (context,index){
          return FavouriteCard();
        }),
      )
    );
  }
}