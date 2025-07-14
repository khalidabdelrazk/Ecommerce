import 'package:ecommerce/core/common/custom_elevated_button.dart';
import 'package:ecommerce/core/common/custom_text_form_field.dart';
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_view_model.dart';
import 'package:flutter/cupertino.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthenticationViewModel authenticationViewModel =
      getIt<AuthenticationViewModel>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: authenticationViewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your full name',
            keyboardType: TextInputType.name,
            controller: authenticationViewModel.fullNameController,
          ),
          verticalSpacing(20),
          Text('Email', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your email',
            keyboardType: TextInputType.emailAddress,
            controller: authenticationViewModel.emailController,
          ),
          verticalSpacing(20),
          Text('Password', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your password',
            keyboardType: TextInputType.visiblePassword,
            controller: authenticationViewModel.passwordController,
            obscureText: !authenticationViewModel.isPasswordVisible,
            suffixIcon: GestureDetector(
              onTap: () => authenticationViewModel.togglePasswordVisibility(),
              child: Icon(
                authenticationViewModel.isPasswordVisible
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          verticalSpacing(20),
          Text('Confirm Password', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'confirm your password',
            keyboardType: TextInputType.visiblePassword,
            controller: authenticationViewModel.confirmPasswordController,
            obscureText: !authenticationViewModel.isConfirmPasswordVisible,
            suffixIcon: GestureDetector(
              onTap: () {
                authenticationViewModel.toggleConfirmPasswordVisibility();
              },
              child: Icon(
                authenticationViewModel.isConfirmPasswordVisible
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          verticalSpacing(20),
          Text('Phone Number', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your phone number',
            keyboardType: TextInputType.phone,
            controller: authenticationViewModel.phoneController,
          ),
          verticalSpacing(20),
          CustomElevatedButton(
            text: 'Sign Up',
            onPressed: () {
              authenticationViewModel.signup();
            },
            backgroundColor: AppColors.whiteColor,
            textStyle: AppStyles.medium18Header,
          ),
        ],
      ),
    );
  }
}
