import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/AddCartResponseEntity.dart';
import '../../../entities/CategoryOrBrandResponseEntity.dart';
import '../../../entities/ProductResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
