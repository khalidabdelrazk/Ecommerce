
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/product%20tab/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CategoryItems extends StatefulWidget {
  final ProductTabViewModel productTabViewModel;
  const CategoryItems({super.key, required this.productTabViewModel});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.productTabViewModel.fetchItems(reset: true);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 300) {
      widget.productTabViewModel.fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = widget.productTabViewModel.generateKey(widget.productTabViewModel.selectedCategory);
    final products = widget.productTabViewModel.items[key] ?? [];

    if (products.isEmpty) {
      return const Center(child: Text('No Products Found'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        controller: _scrollController,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.productTabViewModel.isHidden ? 2 : 1,
          childAspectRatio: widget.productTabViewModel.isHidden ? 0.685 : 0.911,
          crossAxisSpacing: widget.productTabViewModel.isHidden ? 8 : 4,
          mainAxisSpacing: widget.productTabViewModel.isHidden ? 8 : 4,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
