import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow:[
    BoxShadow(
            color: Colors.grey.shade400, 
            spreadRadius: 2, 
            blurRadius: 8, 
            offset: const Offset(0, 4), 
          ),
        ],
        color: kwidgetColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                
                child: Image.network(productModel.imageCover,width: MediaQuery.of(context).size.width/3,height: 100,fit: BoxFit.fill,)),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Column(children: [
                                 Text(
                                  maxLines: 2,
                                  productModel.title,style: TextStyle(overflow: TextOverflow.ellipsis,color: kButtonColor,fontSize: 14,fontWeight: FontWeight.bold),),
                                 Text('⭐${productModel.rating}',style: TextStyle(color: const Color.fromARGB(255, 121, 148, 152),fontSize: 14,fontWeight: FontWeight.bold),)
                          ],),
                ),
                      CircleAvatar(
                    backgroundColor: kButtonColor,
                    radius: 15,
                    child: Icon(FontAwesomeIcons.plus,size: 12,color: kPrimaryColor,)
                      
                
                  ),
                ],)
              ],
            )
           ,
        ),
      );
  }
}
