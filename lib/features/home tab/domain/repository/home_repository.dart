import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getCategories();
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getBrands();
}
