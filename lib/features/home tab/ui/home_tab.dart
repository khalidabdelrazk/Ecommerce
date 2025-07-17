import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_view_model.dart';
import 'package:ecommerce/features/home%20tab/ui/widgets/category_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeViewModel viewModel = getIt<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            verticalSpacing(20),
            _buildAnnouncement(images: viewModel.images),
            verticalSpacing(20),
            _titleAndViewAll(title: "Categories"),
            verticalSpacing(0),
            CategoryBar(homeViewModel: viewModel),
            verticalSpacing(20),
          ],
        ),
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
