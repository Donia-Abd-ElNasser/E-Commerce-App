import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/Auth/auth_cubit/auth_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context)=>AuthCubit(ApiServices())),
    
    

  ],
    
    
    child: const EcommerceApp()));
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
