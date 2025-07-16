import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            // Navigate to the login screen
          },
          child: Text(
            'Login',
            style: AppStyles.light16White,
          ),
        ),
      ],
    );
  }
}
