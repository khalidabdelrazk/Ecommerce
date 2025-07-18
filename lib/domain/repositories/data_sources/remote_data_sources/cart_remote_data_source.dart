import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getItemsInCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemsInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
