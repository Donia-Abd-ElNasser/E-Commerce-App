import 'package:ecommerce/screens/cart/view/cart_view.dart';
import 'package:ecommerce/screens/cart/view_model/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/screens/checkout/views/checkout_view.dart';
import 'package:ecommerce/screens/favourite/view/favourite_view.dart';
import 'package:ecommerce/screens/home/view/home_view.dart';

import 'package:ecommerce/screens/profile/view/profile_view.dart';
import 'package:ecommerce/screens/shipping/view_model/cubit/shipping_cubit.dart';
import 'package:ecommerce/screens/shipping/views/shipping_view.dart';
import 'package:ecommerce/screens/Auth/signin/view/signin_view.dart';
import 'package:ecommerce/screens/Auth/signup/view/signup_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kHomeView = '/homeView';
  static const kSigninView = '/signinView';
  static const kSignupView = '/signupView';
  static const kFavouriteView = '/favouriteView';
  static const kProfileView = '/profileView';
  static const kCartView = '/cartView';
  static const kPayementView = '/payementView';
  static const kProductDetailsView = '/ProductDetailsView';
  static const kCheckout = '/Checkout';
  static const kShippingView = '/ShippingView';
  static GoRouter getRouter({required bool isLoggedIn}) {
    return GoRouter(
      initialLocation: isLoggedIn ? kHomeView : '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SignUpView()),
        GoRoute(
          path: kSigninView,
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
        GoRoute(
          path: AppRoutes.kShippingView,
          builder: (context, state) {
            final shippingCubit = state.extra as ShippingCubit;
            return BlocProvider.value(
              value: shippingCubit,
              child: const ShippingView(),
            );
          },
        ),

        GoRoute(
          path: kFavouriteView,
          builder: (context, state) => const FavouriteView(),
        ),
        GoRoute(path: kCartView, builder: (context, state) => const CartView()),
        GoRoute(
          path: kCheckout,
          builder: (context, state) {
            final cartCubit = state.extra as CartCubit;
            return Checkout(cartCubit: cartCubit);
          },
        ),
        GoRoute(
          path: kProfileView,
          builder: (context, state) => const ProfileView(),
        ),
      ],
    );
  }
}
