

import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  Failures failures;

  CategoryErrorState({required this.failures});
}

class CategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity;

  CategorySuccessState({required this.responseEntity});
}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  Failures failures;

  BrandErrorState({required this.failures});
}

class BrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity;

  BrandSuccessState({required this.responseEntity});
}
