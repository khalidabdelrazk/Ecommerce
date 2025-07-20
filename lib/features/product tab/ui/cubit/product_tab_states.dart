import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';

abstract class ProductTabStates {}

class CategorySelectedState extends ProductTabStates {
  final String selectedCategory;
  CategorySelectedState(this.selectedCategory);
}

class ProductTabInitialState extends ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {}

class ProductTabsErrorState extends ProductTabStates {
  final Failures failures;
  ProductTabsErrorState({required this.failures});
}

class ProductsErrorState extends ProductTabStates {
  final Failures failures;
  ProductsErrorState({required this.failures});
}


class ProductTabsSuccessState extends ProductTabStates {
  final ProductTabsResponseEntity responseEntity;
  ProductTabsSuccessState({required this.responseEntity});
}

class ProductsSuccessState extends ProductTabStates {
  final GetProductsResponseEntity responseEntity;
  ProductsSuccessState({required this.responseEntity});
}
