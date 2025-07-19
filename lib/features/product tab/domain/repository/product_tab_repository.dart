import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';

abstract class ProductTabRepository {
  Future<Either<Failures,ProductTabsResponseEntity>> getCategoriesAndBrandsUseCase();
}