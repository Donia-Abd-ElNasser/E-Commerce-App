import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedPayment;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  //  radius: 18,
                  backgroundColor: kButtonColor,
                  child: IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                      ),
                    ),
                    onPressed: () => GoRouter.of(context).pop(),
                  ),
                ),
                SizedBox(width: 95),
                Text(
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
              // Shipping Address
              const ListTile(
                title: Text("Iris Watson"),
                subtitle: Text(
                  "606-3727 Ullamcorper Street\nRoseville NH 11523\n(786) 713-8616",
                ),
                trailing: Icon(Icons.edit, color: kButtonColor),
              ),
              const Divider(),
              ElevatedButton.icon(
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.kShippingView);
                },
                icon: const Icon(Icons.add),
                label: const Text("Add shipping address"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Shipping Method
              const Text("Shipping Method"),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: kButtonColor,style: BorderStyle.solid),
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

              // Payment Method
              const Text("Payment Method"),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor,width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusColor: kButtonColor,
                  fillColor: kButtonColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: kButtonColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  iconColor: kButtonColor,
                ),
                value: selectedPayment,
                items:
                    ["Credit Card", "PayPal", "Cash on Delivery"]
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (value) {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
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
                  '\$234',
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
                  GoRouter.of(context).pushReplacement(AppRoutes.kCartView);
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
