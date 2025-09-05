
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';

import 'package:ecommerce/screens/signup/view/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
   SignUpViewBody({super.key});
final TextEditingController emailController=TextEditingController();
final TextEditingController passwordController=TextEditingController();
final TextEditingController repasswordController=TextEditingController();
final TextEditingController phoneController=TextEditingController();
final TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              const SizedBox(height: 20),
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kButtonColor,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Let’s get started with an Online Shopping .",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              CustomFormTextField(text: 'name', controller: nameController, icon: Icon(Icons.person_outline)),
              
              const SizedBox(height: 15),
              CustomFormTextField(text: 'email', controller: emailController, icon: Icon(Icons.email_outlined)),
              const SizedBox(height: 15),
               CustomFormTextField(text: 'phone', controller: phoneController, icon: Icon( Icons.phone_callback_outlined),obscureText: true,),
                   const SizedBox(height: 15),
              CustomFormTextField(text: 'password', controller: passwordController, icon: Icon( Icons.lock_outline),obscureText: true,),
                 const SizedBox(height: 15),
                  CustomFormTextField(text: 'confirm password', controller: repasswordController, icon: Icon( Icons.lock_outline),obscureText: true,),
                  
              const SizedBox(height: 25),
              
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
                    GoRouter.of(context).push(AppRoutes.kHomeView);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
             
             
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',style: TextStyle(color: kButtonColor)),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.kSigninView);
                    },
                    child: const Text(
                       'Sign In',
                      style: TextStyle(
                        color: kButtonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
