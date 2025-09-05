
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/screens/cart/view/widgets/cart_app_bar.dart';
import 'package:ecommerce/screens/cart/view/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
      backgroundColor: kPrimaryColor,
      bottom:  PreferredSize(preferredSize: Size.fromHeight(20), child: Padding(
      padding: const EdgeInsets.all(16),
      child: CartAppBar(),
    )),),
     body:  SafeArea(
       child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context,index){
        return CartCard();
       }),
     ),
     bottomNavigationBar: Container(padding: EdgeInsets.symmetric(horizontal: 20),
      height: 130,color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Text('Total',style: TextStyle(

  color: kButtonColor,fontSize: 22,
),),
Text('\$234',style: TextStyle(

  color: kButtonColor,fontSize: 22,
),)
            ],
          ),
           SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.kCheckout);
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
        ],
      ),
     ),
    );
  }
}