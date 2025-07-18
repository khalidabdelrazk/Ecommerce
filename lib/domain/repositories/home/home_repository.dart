import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';

import '../../../core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
