import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_items.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final ProductTabViewModel productTabViewModel = getIt<ProductTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Row(
        children: [
          CategoryTabs(
            categories: productTabViewModel.categories,
            selectedCategory: productTabViewModel.selectedCategory,
            onCategorySelected: (category) {
              setState(() => productTabViewModel.selectedCategory = category);
              productTabViewModel.fetchItems(category);
            },
          ),
          CategoryItems(items: productTabViewModel.items),
        ],
      ),
    );
  }
}
