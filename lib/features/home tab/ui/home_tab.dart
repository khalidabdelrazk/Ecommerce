import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_view_model.dart';
import 'package:ecommerce/features/home%20tab/ui/widgets/brands_bar.dart';
import 'package:ecommerce/features/home%20tab/ui/widgets/category_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeTab({super.key, required this.viewModel});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpacing(20),
                _buildAnnouncement(images: widget.viewModel.images),
                verticalSpacing(20),
                _titleAndViewAll(title: "Categories"),
                CategoryBar(homeViewModel: widget.viewModel),
                verticalSpacing(20),
                _titleAndViewAll(title: "Brands"),
                BrandsBar(homeViewModel: widget.viewModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(),
    );
  }

  Widget _titleAndViewAll({
    required String title,
    VoidCallback? onViewAllPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppStyles.semi20Primary.copyWith(fontSize: 18.sp)),
        TextButton(
          onPressed: onViewAllPressed,
          child: Text(
            'View All',
            style: AppStyles.semi20Primary.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
