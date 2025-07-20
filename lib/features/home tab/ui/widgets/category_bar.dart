import 'package:ecommerce/core/helpers/spacing.dart';
import 'package:ecommerce/core/utils/network_error_widget.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_states.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_view_model.dart';
import 'package:ecommerce/features/home%20tab/ui/widgets/category_or_brands_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBar extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const CategoryBar({super.key, required this.homeViewModel});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  void initState() {
    super.initState();
    if (widget.homeViewModel.state is! CategorySuccessState) {
      widget.homeViewModel.getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: widget.homeViewModel,
      builder: (context, state) {
        // if (state is CategoryLoadingState || state is! CategoryErrorState || state is! CategorySuccessState) {
        //   return SizedBox(
        //     height: 285.h,
        //     width: double.infinity,
        //     child: const Center(child: CircularProgressIndicator()),
        //   );
        // }
        if (state is CategoryErrorState) {
          return NetworkErrorWidget(
            errorMsg: state.failures.errorMessage,
            large: false,
            onTap: () async => widget.homeViewModel.getCategories(),
          );
        } else if (state is CategorySuccessState || widget.homeViewModel.categories.isNotEmpty) {
          final categories = widget.homeViewModel.categories;

          if (categories.isEmpty) {
            return const Center(child: Text("No Categories Found"));
          }

          return SizedBox(
            height: 285.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (categories.length / 2).ceil(),
              itemBuilder: (context, index) {
                int firstIndex = index * 2;
                int secondIndex = firstIndex + 1;
                return Column(
                  children: [
                    CategoryOrBrandsItem(category: categories[firstIndex]),
                    verticalSpacing(8),
                    if (secondIndex < categories.length)
                      CategoryOrBrandsItem(category: categories[secondIndex]),
                  ],
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: 285.h,
            width: double.infinity,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
