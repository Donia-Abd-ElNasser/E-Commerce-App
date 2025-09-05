import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PayementAppBar extends StatelessWidget {
  const PayementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
             CircleAvatar(
               backgroundColor: kButtonColor,
        radius: 20,
               child: IconButton(onPressed: (){
                GoRouter.of(context).pop();
               
               }, icon:Center(child: Icon(Icons.arrow_back_ios,color: kPrimaryColor,size: 20,)), ),
             ),
             
            ],
          );
  }
}