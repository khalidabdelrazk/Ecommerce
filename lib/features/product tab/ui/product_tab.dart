import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_states.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_items.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final ProductTabViewModel productTabViewModel = getIt<ProductTabViewModel>();

  @override
  void initState() {
    super.initState();
    // Fetch initial items for the default category
    productTabViewModel.fetchItems(productTabViewModel.selectedCategory);
  }

  @override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => productTabViewModel,
    child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<ProductTabViewModel, ProductTabStates>(
        builder: (context, state) {
          return Row(
            children: [
              CategoryTabs(
                categories: productTabViewModel.categories,
                selectedCategory: productTabViewModel.selectedCategory,
                onCategorySelected: (category) {
                  productTabViewModel.selectCategory(category);
                },
              ),
              CategoryItems(items: productTabViewModel.items),
            ],
          );
        },
      ),
    ),
  );
}

}
