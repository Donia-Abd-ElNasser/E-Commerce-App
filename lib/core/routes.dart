import 'package:ecommerce/screens/cart/view/cart_view.dart';
import 'package:ecommerce/screens/checkout/views/checkout_view.dart';
import 'package:ecommerce/screens/favourite/view/favourite_view.dart';
import 'package:ecommerce/screens/home/view/home_view.dart';
import 'package:ecommerce/screens/product_details/view/product_details.dart';
import 'package:ecommerce/screens/product_details/view_model/product_cubit/product_cubit.dart';
import 'package:ecommerce/screens/profile/view/profile_view.dart';
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
  static GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(path: '/rrr', builder: (context, state) => const SignUpView()),
        GoRoute(
          path: '/rrrrr',
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(path: '/', builder: (context, state) => const HomeView()),
        GoRoute(
          path: kShippingView,
          builder: (context, state) => const ShippingView(),
        ),

        GoRoute(
          path: kFavouriteView,
          builder: (context, state) => const FavouriteView(),
        ),
        GoRoute(path: kCartView, builder: (context, state) => const CartView()),
        GoRoute(path: kCheckout, builder: (context, state) => const Checkout()),
        GoRoute(
          path: kProfileView,
          builder: (context, state) => const ProfileView(),
        ),
        // GoRoute(
        //   path: '/',
        //   builder: (context, state) => const PayementView(),
        // ),
        GoRoute(
          path: kProductDetailsView,
          builder: (context, state) {
            final String id = state.extra != null ? state.extra as String : '';
            return BlocProvider(
              create:
                  (_) =>
                      ProductCubit()
                        ..fetchProductDetails('6428de2adc1175abc65ca05b'),
              child: ProductDetailsPage(productId: '6428de2adc1175abc65ca05b'),
            );
          },
        ),
      ],
    );
  }
}
