import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_states.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_view_model.dart';
import 'package:ecommerce/features/authentication/ui/sign%20in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationViewModel authenticationViewModel =
      getIt<AuthenticationViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: authenticationViewModel,
      listener: (context, state) {
        if (state is AuthenticationLoadingState) {
          return DialogUtils.showLoading(context: context);
        } else if (state is AuthenticationErrorState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: state.error,
            title: "Error",
            posActionName: 'Ok',
          );
        } else if (state is AuthenticationSuccessState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
            context: context,
            message: 'Account Created Successfully',
            title: "Success",
            posActionName: 'Ok',
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250.h,
                    padding: EdgeInsets.symmetric(horizontal: 120.w),
                    child: Image.asset(
                      'assets/images/Route.png',
                      fit: BoxFit.contain,
                      width: 100.w,
                    ),
                  ),
                  SignInForm(authenticationViewModel: authenticationViewModel),
                  verticalSpacing(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
