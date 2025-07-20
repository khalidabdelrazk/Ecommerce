import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/network_error_widget.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_states.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_items.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatefulWidget {
  final ProductTabViewModel productTabViewModel;
  const ProductTab({super.key, required this.productTabViewModel});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  void initState() {
    super.initState();
    widget.productTabViewModel.getCategoriesAndBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<ProductTabViewModel, ProductTabStates>(
        builder: (context, state) {
          if (state is ProductTabsSuccessState ||
              widget.productTabViewModel.categories.isNotEmpty) {
            return Stack(
              children: [
                Row(
                  children: [
                    if (!widget.productTabViewModel.isHidden)
                      SizedBox(
                        width: 137.w,
                        child: CategoryTabs(
                          categories: widget.productTabViewModel.categories,
                          selectedCategory:
                              widget
                                  .productTabViewModel
                                  .selectedCategory
                                  .name ??
                              "",
                          // onCategorySelected: widget.productTabViewModel.selectCategory,
                          // onDoubleTap: widget.productTabViewModel.toggleVisibility,
                          productTabViewModel: widget.productTabViewModel,
                        ),
                      ),
                    Expanded(
                      child: CategoryItems(
                        productTabViewModel: widget.productTabViewModel,
                      ),
                    ),
                  ],
                ),
                if (widget.productTabViewModel.isHidden)
                  Positioned(
                    left: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: widget.productTabViewModel.toggleVisibility,
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          } else if (state is ProductTabsErrorState) {
            return NetworkErrorWidget(
              errorMsg: state.failures.errorMessage,
              large: true,
              onTap: () async =>
                  widget.productTabViewModel.getCategoriesAndBrands(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
