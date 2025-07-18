import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/domain/entities/AddCartResponseEntity.dart';
import 'package:ecommerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';    

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
