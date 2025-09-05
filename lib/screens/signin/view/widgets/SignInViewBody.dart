import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/screens/signup/view/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
           mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height:190),
             
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: kButtonColor,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Sign in to continue shopping.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Email field
              CustomFormTextField(
                text: 'Email',
                controller: emailController,
                icon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 15),

              // Password field
              CustomFormTextField(
                text: 'Password',
                controller: passwordController,
                icon: const Icon(Icons.lock_outline),
                obscureText: true,
              ),
              const SizedBox(height: 25),

              // Sign in button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    foregroundColor: kButtonColor,
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
                    "Sign In",
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
