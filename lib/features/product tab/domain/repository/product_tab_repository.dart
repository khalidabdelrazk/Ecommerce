import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_request_body.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';

abstract class ProductTabRepository {
  Future<Either<Failures,ProductTabsResponseEntity>> getCategoriesAndBrandsUseCase();
    Future<Either<Failures, GetProductsResponseEntity>> getProducts({
    required GetProductsRequestBody requestBody,
  });
}