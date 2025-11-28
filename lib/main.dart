import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/routes.dart';
import 'package:ecommerce/core/shared_preference.dart';
import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/Auth/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/favourite/view_model/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();


  String? token = CacheHelper.getData(key: 'token');
  bool isLoggedIn = token != null;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(ApiServices())),
        BlocProvider(create: (context) => CartCubit(ApiServices())..fetchCart()),
         BlocProvider(create: (_) => FavCubit()),
      ],
      child: EcommerceApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.getRouter(isLoggedIn: isLoggedIn), 
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: kGtsectrafont,
          displayColor: kButtonColor,
          bodyColor: kButtonColor,
        ),
      ),
    );
  }
}
