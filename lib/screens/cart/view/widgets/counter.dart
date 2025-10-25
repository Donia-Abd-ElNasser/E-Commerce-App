import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Counter extends StatelessWidget {
   Counter({super.key, required this.id, required this.quantity});
final String id;
final int quantity;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
   
      decoration: BoxDecoration(
  color: Colors.transparent,
  borderRadius: BorderRadius.circular(40)

      ),
    
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: kButtonColor,
             // disabledColor: kButtonColor,
              onPressed: () {
               
                 
                    BlocProvider.of<CartCubit>(context).decreaseQuantity(id);
                  
               
              },
              icon: Icon(FontAwesomeIcons.minus,size: 15,)
            ),
           SizedBox(width: 8,),
            Text(
              quantity.toString(),
              style: TextStyle(
                color: kButtonColor,
                fontSize: 20,
        
                fontWeight: FontWeight.bold,
              ),
            ),  SizedBox(width: 8,),
           IconButton(
            color: kButtonColor,
            hoverColor: kButtonColor,
              onPressed: () {
              
                  
                 BlocProvider.of<CartCubit>(context).increaseQuantity(id);
               
              },
              icon: Icon(FontAwesomeIcons.plus,size: 15,)
            ),
          ],
        ),
    );
  }}

