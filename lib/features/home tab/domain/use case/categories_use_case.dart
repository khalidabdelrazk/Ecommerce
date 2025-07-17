import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_response_entity.dart';
import 'package:ecommerce/features/home%20tab/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase {
  final HomeRepository homeRepository;

  CategoriesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoriesResponseEntity>> invoke() {
    return homeRepository.getCategories();
  }
}