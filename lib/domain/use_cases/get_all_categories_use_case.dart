import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/repositories/home/home_repository.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepository.getAllCategories();
  }
}
