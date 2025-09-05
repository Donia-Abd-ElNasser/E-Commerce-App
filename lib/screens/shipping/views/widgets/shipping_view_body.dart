import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShippingViewBody extends StatelessWidget {
  const ShippingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
                SizedBox(width: 50),
                Text(
                  'Add Shipping Address',
                  style: TextStyle(
                    color: kButtonColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: kButtonColor,
                      decoration: InputDecoration(
                        labelText: "First name",
                        labelStyle: TextStyle(color: kButtonColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kButtonColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      cursorColor: kButtonColor,
                      decoration: InputDecoration(
                        labelText: "Last name",
                        labelStyle: TextStyle(color: kButtonColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kButtonColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: kButtonColor,
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: kButtonColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: kButtonColor,
                decoration: InputDecoration(
                  labelText: "City",
                  labelStyle: TextStyle(color: kButtonColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: kButtonColor,
                      decoration: InputDecoration(
                        labelText: "State",
                        labelStyle: TextStyle(color: kButtonColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kButtonColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      cursorColor: kButtonColor,
                      decoration: InputDecoration(
                        labelText: "ZIP code",
                        labelStyle: TextStyle(color: kButtonColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kButtonColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                cursorColor: kButtonColor,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  labelStyle: TextStyle(color: kButtonColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 280),

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
                    GoRouter.of(context).pop();
                  },
                  child: const Text(
                    "Add Address",
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
