import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccount extends StatelessWidget {
  final VoidCallback? onSignUpPressed;
  const DoNotHaveAccount({super.key, this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account?',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: onSignUpPressed,
          child:  Text(
            'Sign Up',
            style: AppStyles.light16White,
          ),
        ),
      ],
    );
  }
}