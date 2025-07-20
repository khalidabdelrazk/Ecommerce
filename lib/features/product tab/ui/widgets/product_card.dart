import 'package:ecommerce/core/common/custom_image.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 160.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            SizedBox(
              height: 140.h,
              width: double.infinity,
              child: CustomImage(
                product.imageCover ?? '',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              color: Colors.black87,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    product.description ?? '',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        'EGP ${product.price?.toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      if (product.price! * 1.2 > product.price!)
                        Text(
                          '${(product.price! * 1.2).toStringAsFixed(0)} EGP',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10.sp,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        'Review (${product.ratingsAverage?.toStringAsFixed(1)})',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.star, color: Colors.amber, size: 12.sp),
                      const Spacer(),
                      CircleAvatar(
                        radius: 12.r,
                        backgroundColor: Colors.blue.shade800,
                        child: Icon(Icons.add, color: Colors.white, size: 14.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
