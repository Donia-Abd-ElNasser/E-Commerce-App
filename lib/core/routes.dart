

import 'package:ecommerce/screens/signin/view/signin_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  
  static const kHomeView = '/homeView';

  static const kSignupView = '/signupView';
  static const kSavedView = '/savedView';
  static const kProfileView = '/profileView';
 

  
 
  static GoRouter getRouter() {
    return GoRouter(
   
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SignInView(),
        ),
       
       
      ],
    );
  }
}