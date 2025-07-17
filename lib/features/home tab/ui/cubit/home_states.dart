

import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_response_entity.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class CategoryLoadingState extends HomeStates {}

class CategoryErrorState extends HomeStates {
  Failures failures;

  CategoryErrorState({required this.failures});
}

class CategorySuccessState extends HomeStates {
  CategoriesResponseEntity responseEntity;

  CategorySuccessState({required this.responseEntity});
}

// class BrandLoadingState extends HomeStates {}

// class BrandErrorState extends HomeStates {
//   Failures failures;

//   BrandErrorState({required this.failures});
// }

// class BrandSuccessState extends HomeStates {
//   CategoryOrBrandResponseEntity responseEntity;

//   BrandSuccessState({required this.responseEntity});
// }
