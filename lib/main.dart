import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.getRouter(),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor:kPrimaryColor ,
        textTheme: ThemeData.light().textTheme.apply(
           fontFamily: kGtsectrafont,
           displayColor: kButtonColor,
           bodyColor: kButtonColor
        ),
      )
       );
  }
}
