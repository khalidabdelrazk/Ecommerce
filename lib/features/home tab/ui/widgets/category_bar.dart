import 'package:ecommerce/core/common/custom_image.dart';
import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/core/utils/network_error_widget.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_states.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBar extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const CategoryBar({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    print(homeViewModel.categories.length);
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: homeViewModel..getCategories(),
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return SizedBox(
            height: 285.h,
            width: double.infinity,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CategoryErrorState) {
          return NetworkErrorWidget(
            errorMsg: state.failures.errorMessage,
            large: false,
          );
        }
        return SizedBox(
          height: 285.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeViewModel.categories.length.isOdd
                ? homeViewModel.categories.length ~/ 2 + 1
                : homeViewModel.categories.length ~/ 2,
            itemBuilder: (context, index) {
              if(index == homeViewModel.categories.length ~/ 2 + 1) {
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
                        homeViewModel.categories.last.image ?? '',
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.cover,
                        radius: 50.r,
                        isNetwork: true,
                      ),
                    ),
                    Text(
                      homeViewModel.categories.last.name ?? '',
                      style: AppStyles.regular12Text,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              }
              int categoryIndex = index * 2;
              final category = homeViewModel.categories;
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
                      category[categoryIndex].image ?? '',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      radius: 50.r,
                      isNetwork: true,
                    ),
                  ),
                  Text(
                    category[categoryIndex].name ?? '',
                    style: AppStyles.regular12Text,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(8),
                  Container(
                    width: 100.w,
                    height: 100.h,
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: CustomImage(
                      category[categoryIndex + 1].image ?? '',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      radius: 50.r,
                      isNetwork: true,
                    ),
                  ),
                  Text(
                    category[categoryIndex + 1].name ?? '',
                    style: AppStyles.regular12Text,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        );
        /* return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: homeViewModel.categories.map((category) {
              int index = 0;
              index += 2;
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
                      homeViewModel.categories.isNotEmpty
                          ? homeViewModel.categories[index - 1].image ?? ''
                          : '',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      radius: 50.r,
                      isNetwork: true,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: CustomImage(
                      homeViewModel.categories.isNotEmpty
                          ? homeViewModel.categories[index - 2].image ?? ''
                          : '',
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                      radius: 50.r,
                      isNetwork: true,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        );*/
      },
    );
  }
}
