import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class CustomTxt extends StatelessWidget {
  final Color? fontColor;
  final String text;
  final double? fontSize;
  final TextStyle? textStyle;

  final FontWeight? fontWeight;

  const CustomTxt(
      {this.fontWeight,
      this.fontSize,
      required this.text,
      this.fontColor,
      this.textStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    The FittedBox widget scales and fits the text within its parent widget.
    By setting fit: BoxFit.scaleDown, the text will shrink to fit within the available space if necessary.
     */
    return AutoSizeText(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          Theme.of(context).textTheme.titleMedium?.copyWith(
                color: fontColor ?? AppColors.primaryColor,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? 18.sp,
              ),
    );
  }
}
