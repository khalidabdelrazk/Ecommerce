import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatefulWidget {
  final ProductTabViewModel productTabViewModel;

  const CategoryItems({super.key, required this.productTabViewModel});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.productTabViewModel.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: widget.productTabViewModel.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.productTabViewModel.isHidden ? 2 : 1,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(
                widget
                        .productTabViewModel
                        .items[widget.productTabViewModel.selectedCategory.name]
                        ?.id
                        ?.toString() ??
                    "",
              ),
            ),
          );
        },
      ),
    );
  }
}
