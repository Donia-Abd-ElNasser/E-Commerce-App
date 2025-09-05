import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundColor: kButtonColor,
        radius: 30,
        child: BackButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
