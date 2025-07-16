import 'package:ecommerce/core/common/app_text_button.dart';
import 'package:ecommerce/core/common/custom_text_form_field.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/validators.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_view_model.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  final AuthenticationViewModel authenticationViewModel;

  const SignInForm({super.key, required this.authenticationViewModel});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email', style: AppStyles.light16White),
          verticalSpacing(8),
          AppTextFormField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: widget.authenticationViewModel.emailController,
            validator: (p0) => AppValidators.validateEmail(p0),
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
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(text: 'Forget Password?', onPressed: () {}, textStyle: AppStyles.light16White),
          ),
        ],
      ),
    );
  }
}
