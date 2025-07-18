import 'package:ecommerce/core/common/custom_image.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final CategoryOrBrandsEntity category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: CustomImage(
            category.image ?? '',
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
            radius: 50.r,
            isNetwork: true,
          ),
        ),
        Text(
          category.name ?? '',
          style: AppStyles.regular12Text,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
