import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/shipping/view_model/cubit/shipping_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShippingViewBody extends StatelessWidget {
  const ShippingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    //final cubit = BlocProvider.of<ShippingCubit>(context);
    final state = BlocProvider.of<ShippingCubit>(context).state;

    final nameController = TextEditingController(text: state.name);
    final addressController = TextEditingController(text: state.address);
    final cityController = TextEditingController(text: state.city);
    final stateController = TextEditingController(text: state.state);
    //final zipController = TextEditingController(text: state.zip);
    final phoneController = TextEditingController(text: state.phone);

    return BlocProvider(
      create: (context) => ShippingCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            "Edit Shipping Address",
            style: TextStyle(color: kButtonColor),
          ),
          iconTheme: const IconThemeData(color: kButtonColor),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: _inputDecoration("Full Name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: addressController,
                  decoration: _inputDecoration("Address"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: cityController,
                  decoration: _inputDecoration("City"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: stateController,
                  decoration: _inputDecoration("State"),
                ),
               
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: _inputDecoration("Phone Number"),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    BlocProvider.of<ShippingCubit>(context).updateShipping(
                      name: nameController.text,
                      address: addressController.text,
                      city: cityController.text,
                      stateValue: stateController.text,
                     
                      phone: phoneController.text,
                    );
                    GoRouter.of(context).pop();
                  },
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: kButtonColor),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kButtonColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
