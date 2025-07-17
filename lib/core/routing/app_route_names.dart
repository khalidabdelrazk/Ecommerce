import 'package:ecommerce/features/authentication/ui/authentication.dart';
import 'package:ecommerce/features/root/ui/root.dart';
import 'package:flutter/cupertino.dart';

import 'app_routes.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    // Define your routes here
    AppRoutes.authenticationRoute: (context) => const Authentication(),
    AppRoutes.root: (context) => Root(),

    // AppRoutes.loginRoute: (context) => const Login(),
    // AppRoutes.registerRoute: (context) => SignUp(),
    // AppRoutes.root: (context) => const Root(),

    // AppRoutes.cartRoute: (context) => CartScreen(),
    // AppRoutes.productRoute: (context) => ProductDetailsScreen(),
  };
}
