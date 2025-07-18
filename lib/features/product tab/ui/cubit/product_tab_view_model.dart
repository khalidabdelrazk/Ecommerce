import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_states.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends HydratedCubit<ProductTabStates> {
  ProductTabViewModel() : super(ProductTabInitialState());

  // Initial category and items
  String selectedCategory = 'Men’s Fashion';
  List<String> items = [];
  final List<String> categories = [
    'Men’s Fashion',
    'Women’s Fashion',
    'Skincare',
    'Beauty',
    'Headphones',
    'Cameras',
    'Laptops & Electronics',
    'Baby & Toys',
  ];

  void selectCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      fetchItems(category);
      emit(CategorySelectedState(selectedCategory));
      // Simulate a delay for loading state
      Future.delayed(const Duration(seconds: 1), () {
        emit(ProductTabInitialState());
      });
    }
  }

  void fetchItems(String category) {
    items = List.generate(10, (index) => '$category Item $index');
  }

  @override
  Map<String, dynamic>? toJson(ProductTabStates state) {
    if (state is ProductTabInitialState) {
      return {'selectedCategory': selectedCategory};
    }
    return null;
  }

  @override
  ProductTabStates fromJson(Map<String, dynamic> json) {
    selectedCategory = json['selectedCategory'] ?? 'Men’s Fashion';
    return ProductTabInitialState();
  }
}
