import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_states.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_items.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/category_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // Fetch initial items for the default category
    widget.productTabViewModel.getCategoriesAndBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: BlocBuilder<ProductTabViewModel, ProductTabStates>(
          builder: (context, state) {
            return Row(
              children: [
                CategoryTabs(
                  categories: widget.productTabViewModel.categories2,
                  selectedCategory: widget.productTabViewModel.selectedCategory,
                  onCategorySelected: (category) {
                    widget.productTabViewModel.selectCategory(category);
                  },
                ),
                CategoryItems(items: widget.productTabViewModel.items),
              ],
            );
          },
        ),
      );;
  }
}
