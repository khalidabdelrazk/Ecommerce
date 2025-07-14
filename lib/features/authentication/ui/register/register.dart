import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_states.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_view_model.dart';
import 'package:ecommerce/features/authentication/ui/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthenticationViewModel authenticationViewModel =
      getIt<AuthenticationViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationViewModel, AuthenticationStates>(
      bloc: authenticationViewModel,
      listener: (context, state) {
        if (state is AuthenticationLoadingState) {
          DialogUtils.showLoading(context: context);
        }else if(state is AuthenticationErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            title: 'Error',
            message: state.error ?? 'An error occurred while signing up.',
            negAction: () {
              Navigator.pop(context);
            },
          );
        } 
        else if (state is SignupSuccessState) {
          DialogUtils.hideLoading(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Sign Up Successful!')));
          // Navigate to another screen or perform other actions
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
                  const RegisterForm(),
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
