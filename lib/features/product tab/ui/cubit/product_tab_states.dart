import 'package:ecommerce/core/error/failures.dart';
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

class ProductTabsSuccessState extends ProductTabStates {
  final ProductTabsResponseEntity responseEntity;
  ProductTabsSuccessState({required this.responseEntity});
}
