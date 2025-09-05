import 'package:ecommerce/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class FavAppBar extends StatelessWidget {
  const FavAppBar({super.key});

  @override

  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                        backgroundColor:kButtonColor ,
                        child: IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
                          ),
                          onPressed: () => GoRouter.of(context).pop(),
                        ),
                      ),
              CircleAvatar(
        backgroundColor: kButtonColor,
        radius: 20,
        child: Icon(FontAwesomeIcons.solidHeart,color: kPrimaryColor,size: 20,)
          
    
      )
            ],
          );
  }
}