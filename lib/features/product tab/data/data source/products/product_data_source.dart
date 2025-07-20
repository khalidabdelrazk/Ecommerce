import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/data/model/get_poduct_reponse_dm.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_request_body.dart';

abstract class ProductDataSource {
  Future<Either<Failures, GetProductsResponseDm>> getProducts({
    required GetProductsRequestBody requestBody,
  });
}
