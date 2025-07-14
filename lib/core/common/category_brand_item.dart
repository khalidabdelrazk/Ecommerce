import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_image.dart';

class CategoryBrandItem extends StatelessWidget {
  final String imgUrl, title;

  const CategoryBrandItem({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Important to avoid overflow
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.1),
            ),
            child: ClipOval(
              child: CustomImage(
                imgUrl,
                width: 80.h,
                height: 80.h,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Flexible(
            child: Text(
              title,
              style: AppStyles.medium14PrimaryDark,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
