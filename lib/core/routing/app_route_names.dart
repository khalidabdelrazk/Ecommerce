// import 'package:ecommerce/presentation/authentication/Features/auth/register.dart';
// import 'package:ecommerce/presentation/authentication/Features/auth/login.dart';
// import 'package:ecommerce/presentation/root/ui/root.dart';
import 'package:ecommerce/features/authentication/ui/authentication.dart';
import 'package:ecommerce/features/authentication/ui/sign%20up/sign_up.dart';
import 'package:flutter/cupertino.dart';

import 'app_routes.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    // Define your routes here
    AppRoutes.authenticationRoute: (context) => const Authentication(),

    // AppRoutes.loginRoute: (context) => const Login(),
    // AppRoutes.registerRoute: (context) => SignUp(),
    // AppRoutes.root: (context) => const Root(),

    // AppRoutes.cartRoute: (context) => CartScreen(),
    // AppRoutes.productRoute: (context) => ProductDetailsScreen(),
  };
}
