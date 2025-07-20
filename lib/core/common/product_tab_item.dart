import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'custom_text.dart';

class ProductTabItem extends StatelessWidget {
  final ProductEntity dataEntity;
  final double? width, height;

  const ProductTabItem({super.key, required this.dataEntity, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: dataEntity.imageCover ?? '',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.redColor),
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 20.r,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        // todo add to favorite
                      },
                      color: AppColors.primaryColor,
                      padding: EdgeInsets.zero,
                      iconSize: 30.r,
                      // Adjust icon size as needed
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(text: dataEntity.description ?? '', fontSize: 12.sp),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomTxt(text: "EGP ${dataEntity.price}"),
                    SizedBox(width: 8.w),
                    CustomTxt(
                      text: "EGP ${dataEntity.price! * 2}",
                      textStyle: AppStyles.regular11SalePrice.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomTxt(
                      text: "Review (${dataEntity.ratingsAverage})",
                      fontSize: 12.sp,
                    ),
                    Icon(Icons.star, color: AppColors.yellowColor, size: 25.sp),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                        // ProductTabViewModel.get(context)
                        //     .addToCart(dataEntity.id ?? '');
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
