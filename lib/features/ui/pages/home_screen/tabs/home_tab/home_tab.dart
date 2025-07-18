import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../widgets/category_brand_item.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          _buildAnnouncement(images: viewModel.images),
          SizedBox(
            height: 24.h,
          ),
          _lineBreak(name: "Categories"),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllCategories(),
            builder: (context, state) {
              return viewModel.categoriesList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : _buildCategoryBrandSec(list: viewModel.categoriesList);

              // if (state is CategoryLoadingState) {
              //   return const Center(
              //     child: CircularProgressIndicator(
              //       color: AppColors.primaryColor,
              //     ),
              //   );
              // } else if (state is CategoryErrorState) {
              //   return Center(
              //     child: Text(state.failures.errorMessage),
              //   );
              // } else if (state is CategorySuccessState || state is BrandSuccessState) {
              //   return _buildCategoryBrandSec(list: viewModel.categoriesList);
              // }
              // return Container(
              //   child: Text('fa5ayaaaaaaa'),
              // );
            },
          ),
          // child: _buildCategoryBrandSec(const CategoryBrandItem())),
          _lineBreak(name: "Brands"),

          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel..getAllBrands(),
            builder: (context, state) {
              return viewModel.brandsList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : _buildCategoryBrandSec(list: viewModel.brandsList);
              if (state is BrandLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (state is BrandErrorState) {
                return Center(
                  child: Text(state.failures.errorMessage),
                );
              } else if (state is BrandSuccessState ||
                  state is CategorySuccessState) {
                return _buildCategoryBrandSec(list: viewModel.brandsList);
              }
              return Container(
                child: Text('fa5ayaaaaaaa num2'),
              );
            },
          )
          // child: _buildCategoryBrandSec(list: )),
        ],
      ),
    );
  }

  SizedBox _buildCategoryBrandSec({required List<CategoryOrBrandEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.w),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryBrandItem(item: list[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
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
          return Image.asset(
            url,
            fit: BoxFit.fill,
          );
        }).toList());
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        )
      ],
    );
  }
}
