import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

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
          onPressed: () {
            // Navigate to the sign-up screen
          },
          child:  Text(
            'Sign Up',
            style: AppStyles.light16White,
          ),
        ),
      ],
    );
  }
}