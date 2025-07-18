import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/domain/entities/GetCartResponseEntity.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepository cartRepository;

  UpdateCountInCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepository.updateCountInCart(productId, count);
  }
}
