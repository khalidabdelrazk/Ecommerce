import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import 'custom_txt.dart';

class CartItem extends StatelessWidget {
  GetProductEntity productEntity;

  CartItem({required this.productEntity});
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
              _buildImageContainer(
                  imageUrl: productEntity.product!.imageCover ?? ''),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  child: Column(
                    children: [
                      _buildItemHeader(
                          title: productEntity.product!.title ?? '',
                          context: context,
                          productId: productEntity.product?.id ?? ''),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTxt(
                            text: 'Egy ${productEntity.price}',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          Container(
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
                                    int count = productEntity.count!.toInt();
                                    count--;
                                    //todo: decrement count
                                    CartViewModel.get(context)
                                        .updateCountInCart(
                                            productEntity.product?.id ?? '',
                                            count);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 25.sp,
                                  ),
                                ),
                                CustomTxt(
                                  text: '${productEntity.count}',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontColor: AppColors.whiteColor,
                                ),
                                IconButton(
                                  onPressed: () {
                                    //todo: increment count
                                    int count = productEntity.count!.toInt();
                                    count++;
                                    //todo: decrement count
                                    CartViewModel.get(context)
                                        .updateCountInCart(
                                            productEntity.product?.id ?? '',
                                            count);
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 25.sp,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
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

  Widget _buildImageContainer({required String imageUrl}) {
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
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.redColor,
          ),
        ),
      ),
    );
  }

  Widget _buildItemHeader(
      {required String title,
      required BuildContext context,
      required String productId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: CustomTxt(text: title)),
        InkWell(
          onTap: () {
            // TODO: delete item from cart
            CartViewModel.get(context).deleteItemsInCart(productId);
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
        CircleAvatar(
          backgroundColor: AppColors.blackColor,
          radius: 10.r,
        ),
        SizedBox(width: 10.w),
        CustomTxt(
          text: "black | size 40",
          fontColor: AppColors.blackColor.withOpacity(0.4),
          fontSize: 14.sp,
        ),
      ],
    );
  }

  Widget _buildItemPrice({required double price, required int count}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTxt(
          text: "Egp $price",
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        _buildQuantityControl(count: count),
      ],
    );
  }

  Widget _buildQuantityControl({required int count}) {
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
              //todo: increment count
            },
            icon: Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.whiteColor,
              size: 25.sp,
            ),
          ),
          CustomTxt(
            text: "$count",
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontColor: AppColors.whiteColor,
          ),
          IconButton(
            onPressed: () {
              //todo: increment count
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
