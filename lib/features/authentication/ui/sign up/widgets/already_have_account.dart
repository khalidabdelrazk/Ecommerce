import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final VoidCallback? onLoginPressed;
  const AlreadyHaveAccount({super.key, this.onLoginPressed});

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
          onPressed: onLoginPressed,
          child: Text(
            'Login',
            style: AppStyles.light16White,
          ),
        ),
      ],
    );
  }
}
