import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/data/model/product_tabs_response_dm.dart';

abstract class ProductTabsDataSource {
  Future<Either<Failures, ProductTabsResponseDm>>
  getCategoriesAndBrandsUseCase();
}
