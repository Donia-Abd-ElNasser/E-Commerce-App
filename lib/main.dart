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
        textTheme: ThemeData.light().textTheme.apply(
           fontFamily: 'kGtsectrafont',
        ),
      )
       );
  }
}
