import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? bgColor;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator; 
  

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.keyboardType,
    this.focusedBorder,
    this.enabledBorder,
    this.bgColor,
    this.controller,
    this.obscureText,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 20.h, horizontal: 17.w),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AppStyles.light18HintText,
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(16.r)),
        filled: true,
        fillColor: AppColors.whiteColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      obscureText: obscureText ?? false,
      style:
          style ??
          AppStyles.semi16TextWhite.copyWith(
            fontSize: 18.sp,
            color: const Color.fromARGB(255, 0, 0, 0),
            letterSpacing: -0.17,
          ),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: (value) => validator?.call(value),
      textInputAction:
          TextInputAction.done, // Specify the action for the keyboard button
    );
  }
}
