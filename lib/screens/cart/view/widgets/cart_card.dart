import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/cart/view/widgets/counter.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.productModel, required this.totalPrice, required this.quantity});
  final ProductModel productModel;
  final double totalPrice;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: kwidgetColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.network(productModel.imageCover, fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      
                      productModel.title,maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: kButtonColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: kGtsectrafont,
                      ),
                    ),
                  ),

                  Text(
                    
                    "Total :\$$totalPrice",
                    
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: kGtsectrafont,
                      color: kButtonColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          
            Counter(id: productModel.id,quantity:quantity),
          ],
        ),
      ),
    );
  }
}
