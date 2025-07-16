import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/authentication/ui/sign%20in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        // routes: Routes.routes,
        // initialRoute: AppRoutes.registerRoute,
        // home: const Register(),
        home: const SignIn(),
      ),
    );
  }
}
