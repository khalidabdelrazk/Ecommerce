import 'package:ecommerce/core/common/custom_elevated_button.dart';
import 'package:ecommerce/core/common/custom_text_form_field.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_view_model.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final AuthenticationViewModel authenticationViewModel;
  const RegisterForm({super.key, required this.authenticationViewModel});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isVisible = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.authenticationViewModel.fullNameController.dispose();
    widget.authenticationViewModel.emailController.dispose();
    widget.authenticationViewModel.passwordController.dispose();
    widget.authenticationViewModel.confirmPasswordController.dispose();
    widget.authenticationViewModel.phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.authenticationViewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your full name',
            keyboardType: TextInputType.name,
            controller: widget.authenticationViewModel.fullNameController,
            validator: AppValidators.validateFullName,
          ),
          verticalSpacing(20),
          Text('Email', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your email',
            keyboardType: TextInputType.emailAddress,
            controller: widget.authenticationViewModel.emailController,
            validator: AppValidators.validateEmail,
          ),
          verticalSpacing(20),
          Text('Password', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'enter your password',
            keyboardType: TextInputType.visiblePassword,
            controller: widget.authenticationViewModel.passwordController,
            obscureText: _isVisible,
            validator: AppValidators.validatePassword,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Icon(
                _isVisible ? Icons.visibility : Icons.visibility_off,
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
            controller: widget.authenticationViewModel.confirmPasswordController,
            obscureText: _isVisible,
            validator: (val) => AppValidators.validateConfirmPassword(
              val,
              widget.authenticationViewModel.passwordController.text,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Icon(
                _isVisible ? Icons.visibility : Icons.visibility_off,
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
            controller: widget.authenticationViewModel.phoneController,
            validator: AppValidators.validatePhoneNumber,
          ),
          verticalSpacing(20),
          CustomElevatedButton(
            text: 'Sign Up',
            onPressed: () {
              widget.authenticationViewModel.signup();
            },
            backgroundColor: AppColors.whiteColor,
            textStyle: AppStyles.medium18Header,
          ),
        ],
      ),
    );
  }
}
