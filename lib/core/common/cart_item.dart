import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../routing/app_routes.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo: navigate to product detail screen
        Navigator.pushNamed(context, AppRoutes.productRoute);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Container(
          height: 142.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.primary30Opacity, width: 1),
          ),
          child: Row(
            children: [
              _buildImageContainer(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    children: [
                      _buildItemHeader(),
                      SizedBox(height: 5.h),
                      _buildItemDetails(),
                      SizedBox(height: 5.h),
                      _buildItemPrice(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary30Opacity, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          width: 130.w,
          height: 145.h,
          fit: BoxFit.cover,
          imageUrl:
              "https://www.nike.sa/dw/image/v2/BDVB_PRD/on/demandware.static/-/Sites-akeneo-master-catalog/default/dw42ccc9ea/nk/a9b/7/6/4/b/1/a9b764b1_834c_413e_aec2_f460112b2de6.jpg?sw=2000&sh=2000&sm=fit",
          placeholder:
              (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.yellowColor),
              ),
          errorWidget:
              (context, url, error) =>
                  const Icon(Icons.error, color: AppColors.redColor),
        ),
      ),
    );
  }

  Widget _buildItemHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          "NIKE AIR JORDAN",
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        InkWell(
          onTap: () {
            // TODO: delete item from cart
          },
          child: Icon(
            CupertinoIcons.delete,
            color: AppColors.primaryColor,
            size: 25.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemDetails() {
    return Row(
      children: [
        CircleAvatar(backgroundColor: AppColors.blackColor, radius: 10.r),
        SizedBox(width: 10.w),
        AutoSizeText(
          "black | size 40",
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryDarkLight,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildItemPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          "Egp 3,500",
          maxLines: 1,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              if (itemCount > 1) {
                setState(() {
                  itemCount--;
                });
              }
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
          AutoSizeText(
            "$itemCount",
            maxLines: 1,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                itemCount++;
              });
            },
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
