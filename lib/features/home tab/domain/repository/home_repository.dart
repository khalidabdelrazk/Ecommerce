import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoriesResponseEntity>> getCategories();
}
