import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/cart/view/widgets/cart_app_bar.dart';
import 'package:ecommerce/screens/cart/view/widgets/cart_card.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(ApiServices())..fetchCart(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CartAppBar(),
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final product = state.items[index];
                    final quantity =
                        BlocProvider.of<CartCubit>(context).quantities[product
                            .id] ??
                        1;
                    final totalForItem = product.price * quantity;
                    return CartCard(
                      productModel: state.items[index],
                      totalPrice: totalForItem,quantity:quantity
                    );
                  },
                );
              } else if (state is CartLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CartFailure) {
                print('henaaaaaaaaaaaaaaaa${state.errMessage}');
                return Text(state.errMessage);
              } else {
                return Text('no data');
              }
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 130,
              color: kPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(color: kButtonColor, fontSize: 22),
                      ),
                      Text(
                        '\$${BlocProvider.of<CartCubit>(context).totalPrice}',
                        style: TextStyle(color: kButtonColor, fontSize: 22),
                      ),
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
                        GoRouter.of(context).push(AppRoutes.kCheckout,extra: BlocProvider.of<CartCubit>(context));
                      },
                      child: const Text(
                        "Checkout",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
