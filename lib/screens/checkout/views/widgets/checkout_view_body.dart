import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_state.dart';
import 'package:ecommerce/screens/shipping/view_model/cubit/shipping_cubit.dart';
import 'package:ecommerce/screens/shipping/view_model/cubit/shipping_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.cartCubit});
  final CartCubit cartCubit;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cartCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: kButtonColor,
                    child: IconButton(
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
                      ),
                      onPressed: () => GoRouter.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 95),
                  const Text(
                    'Checkout',
                    style: TextStyle(
                      color: kButtonColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ShippingCubit, ShippingState>(
                  builder: (context, state) {
                    return ListTile(
                      title: Text(
                        state.name.isEmpty ? "No address added" : state.name,
                      ),
                      subtitle: Text(
                        state.address.isEmpty
                            ? "Please add your address"
                            : "${state.city}, ${state.state}, ${state.address}\n${state.phone}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          final shippingCubit = BlocProvider.of<ShippingCubit>(
                            context,
                          );
                          GoRouter.of(
                            context,
                          ).push(AppRoutes.kShippingView, extra: shippingCubit);
                        },
                        icon: const Icon(Icons.edit),
                        color: kButtonColor,
                      ),
                    );
                  },
                ),
                const Divider(),
                ElevatedButton.icon(
                  onPressed: () {
                    final shippingCubit = BlocProvider.of<ShippingCubit>(
                      context,
                    );
                    GoRouter.of(
                      context,
                    ).push(AppRoutes.kShippingView, extra: shippingCubit);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add shipping address"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                const Text("Shipping Method"),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: kButtonColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pickup at store"),
                      Text("FREE", style: TextStyle(color: kButtonColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Text("Payment Method"),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kButtonColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: kButtonColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    iconColor: kButtonColor,
                  ),
                  dropdownColor: kPrimaryColor,
                  value: selectedPayment,
                  items:
                      ["Credit Card", "PayPal", "Cash on Delivery"]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value;
                    });
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),

        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 130,
          color: kPrimaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(color: kButtonColor, fontSize: 22),
                      ),
                      Text(
                        '\$${BlocProvider.of<CartCubit>(context).totalPrice.toString()}',
                        style: const TextStyle(
                          color: kButtonColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  );
                },
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
                    final shippingCubit = BlocProvider.of<ShippingCubit>(
                      context,
                    );
                    final state = shippingCubit.state;

                    if (state.name.isNotEmpty &&
                        state.address.isNotEmpty &&
                        state.city.isNotEmpty &&
                        state.phone.isNotEmpty &&
                        selectedPayment != null) {
                      showDialog(
                        context: context,
                        builder:
                            (_) => AlertDialog(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: const Text(
                                "✅ Order Completed",
                                style: TextStyle(color: kButtonColor),
                              ),
                              content: const Text(
                                "Your order has been placed successfully!",
                                style: TextStyle(color: kButtonColor),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    GoRouter.of(
                                      context,
                                    ).pushReplacement(AppRoutes.kHomeView);
                                  },
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: kButtonColor),
                                  ),
                                ),
                              ],
                            ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please fill all fields before checkout.",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
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
      ),
    );
  }
}
