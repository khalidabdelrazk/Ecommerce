import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/helpers/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/root/ui/cubit/root_states.dart';
import 'package:ecommerce/features/root/ui/cubit/root_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Root extends StatelessWidget {
  RootViewModel viewModel = getIt<RootViewModel>();

  Root({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootViewModel, RootStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(viewModel.selectedIndex, context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: viewModel.bodyList[viewModel.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Container(
              height: 90.h,
              color: AppColors.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    0,
                    AppAssets.unSelectedHomeIcon,
                    AppAssets.selectedHomeIcon,
                  ),
                  _buildNavItem(
                    1,
                    AppAssets.unSelectedCategoryIcon,
                    AppAssets.selectedCategoryIcon,
                  ),
                  _buildNavItem(
                    2,
                    AppAssets.unSelectedFavouriteIcon,
                    AppAssets.selectedFavouriteIcon,
                  ),
                  _buildNavItem(
                    3,
                    AppAssets.unSelectedAccountIcon,
                    AppAssets.selectedAccountIcon,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int index, String unselectedIcon, String selectedIcon) {
    final isSelected = viewModel.selectedIndex == index;
    return GestureDetector(
      onTap: () => viewModel.bottomNavOnTap(index),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: CircleAvatar(
          radius: 25.r,
          backgroundColor: isSelected
              ? AppColors.whiteColor
              : Colors.transparent,
          child: Image.asset(
            isSelected ? selectedIcon : unselectedIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildCustomBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
      borderRadius: BorderRadius.circular(50.r),
    );
  }

  PreferredSizeWidget _buildAppBar(int index, BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.transparentColor,
      elevation: 0,
      toolbarHeight: index != 3 ? 120.h : kToolbarHeight,
      leadingWidth: double.infinity,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Image.asset(
                AppAssets.routeLogo,
                width: 66.w,
                height: 22.h,
              ),
            ),
            Visibility(
              visible: index != 3,
              child: Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: AppStyles.regular14Text,
                        cursorColor: AppColors.primaryColor,
                        onTap: () {
                          //todo: implement search logic
                        },
                        decoration: InputDecoration(
                          border: _buildCustomBorder(),
                          enabledBorder: _buildCustomBorder(),
                          focusedBorder: _buildCustomBorder(),
                          contentPadding: EdgeInsets.all(16.h),
                          hintStyle: AppStyles.light14SearchHint,
                          hintText: "what do you search for?",
                          prefixIcon: Icon(
                            Icons.search,
                            size: 30.sp,
                            color: AppColors.primaryColor.withOpacity(0.75),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).pushNamed(AppRoutes.cartRoute);
                      },
                      child: Badge(
                        alignment: AlignmentDirectional.topStart,
                        backgroundColor: AppColors.greenColor,
                        label: Text(
                          2.toString(),
                          style: AppStyles.regular12Text.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        child: ImageIcon(
                          const AssetImage(AppAssets.shoppingCart),
                          size: 35.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
