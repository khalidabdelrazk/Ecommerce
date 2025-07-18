

import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';

abstract class CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class DeleteItemsInCartLoadingState extends CartStates {}

class DeleteItemsInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemsInCartErrorState({required this.failures});
}

class DeleteItemsInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  DeleteItemsInCartSuccessState({required this.responseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}
