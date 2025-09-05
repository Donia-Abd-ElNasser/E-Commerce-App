import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class PayementViewBody extends StatelessWidget {
  const PayementViewBody({super.key});

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
                SizedBox(width: 40),
                Text(
                  'Add Payement Method',
                  style: TextStyle(
                    color: kButtonColor,
                    fontSize: 20,
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
               Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                  //  image: const DecorationImage(
                  //image: AssetImage("assets/card_bg.png"), // optional
                  //   fit: BoxFit.cover,
                  // ),
                ),
                height: 200,
                child: const Center(
                  child: Text(
                    "**** **** **** 3698",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              TextFormField(cursorColor: kButtonColor,
                decoration: InputDecoration(
                  labelText: "Name On Card",labelStyle: TextStyle(color: kButtonColor),
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
              TextFormField(cursorColor: kButtonColor,
                decoration: InputDecoration(
                  labelText: "Card Number",labelStyle: TextStyle(color: kButtonColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(cursorColor: kButtonColor,
                      decoration: InputDecoration(
                        labelText: "Exp Month",labelStyle: TextStyle(color: kButtonColor),
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
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      cursorColor: kButtonColor,
                      decoration: InputDecoration(
                        labelText: "Exp Date",labelStyle: TextStyle(color: kButtonColor),
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
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(cursorColor: kButtonColor,
                decoration: InputDecoration(
                  labelText: "CVV",labelStyle: TextStyle(color: kButtonColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kButtonColor, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 130),
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
                    "Add Card",
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















// import 'package:ecommerce/core/constants.dart';

// import 'package:ecommerce/screens/payement/view/widgets/payment_app_bar.dart';
// import 'package:flutter/material.dart';

// class PayementViewBody extends StatelessWidget {
//   const PayementViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//          backgroundColor: kPrimaryColor,
//         bottom:PreferredSize(preferredSize: Size.fromHeight(70), child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: PayementAppBar()) ,),),
//       body: SafeArea(child: Column(), 
//       ),
//     );
//   }
// }