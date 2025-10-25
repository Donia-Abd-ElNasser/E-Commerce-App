import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/checkout/views/widgets/checkout_view_body.dart';
import 'package:ecommerce/screens/shipping/view_model/cubit/shipping_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key,required this.cartCubit});
final CartCubit cartCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cartCubit),
        BlocProvider(create: (_) => ShippingCubit()), 
      ],
      child: CheckoutViewBody(cartCubit: cartCubit),
    );
  }
}