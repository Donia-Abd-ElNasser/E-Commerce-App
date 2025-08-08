import 'package:ecommerce/screens/signin/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
   SignInViewBody({super.key});
 final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
        backgroundColor: const Color(0xFFC4E703),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildTextField(
                label: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 20),
              buildTextField(
                label: "Password",
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC4E703),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}