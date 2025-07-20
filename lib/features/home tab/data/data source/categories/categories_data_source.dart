import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/data/model/category_or_brands_response_dm.dart';

abstract class CategoriesDataSource {
  Future<Either<Failures, CategoriesOrBrandsResponseDm>> getCategories();
}
