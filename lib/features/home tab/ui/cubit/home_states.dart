import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class CategoryLoadingState extends HomeStates {}

class CategoryErrorState extends HomeStates {
  Failures failures;

  CategoryErrorState({required this.failures});
}

class CategorySuccessState extends HomeStates {
  CategoriesOrBrandsResponseEntity responseEntity;

  CategorySuccessState({required this.responseEntity});
}

class BrandsLoadingState extends HomeStates{}
class BrandsErrorState extends HomeStates {
  Failures failures;

  BrandsErrorState({required this.failures});
}

class BrandSuccessState extends HomeStates {
  CategoriesOrBrandsResponseEntity responseEntity;

  BrandSuccessState({required this.responseEntity});
}