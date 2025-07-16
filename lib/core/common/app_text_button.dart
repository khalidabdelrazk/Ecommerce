import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: textStyle ?? AppStyles.medium14LightPrimary),
    );
  }
}