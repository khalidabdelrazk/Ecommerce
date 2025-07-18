import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';
import 'package:ecommerce/features/home%20tab/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsUseCase {
  final HomeRepository homeRepository;

  BrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> invoke() {
    return homeRepository.getBrands();
  }
}
