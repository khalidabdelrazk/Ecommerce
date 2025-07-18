import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/app_colors.dart';

class ProductSlider extends StatefulWidget {
  final List<String> items;
  final int initialIndex;

  ProductSlider({super.key, required this.initialIndex, required this.items});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: widget.items.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                width: double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
                imageUrl: url,
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
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 199.w / 150.h,
            initialPage: widget.initialIndex,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
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
                    )),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.items.length,
            duration: const Duration(microseconds: 0),
            effect: ExpandingDotsEffect(
              dotWidth: 7.w,
              dotHeight: 7.h,
              dotColor: Colors.grey.shade400,
              paintStyle: PaintingStyle.fill,
              activeDotColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
