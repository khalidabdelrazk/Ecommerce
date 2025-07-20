import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/repository/product_tab_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesAndBrandsUseCase {
  final ProductTabRepository productTabRepository;

  GetCategoriesAndBrandsUseCase({required this.productTabRepository});

  Future<Either<Failures, ProductTabsResponseEntity>> invoke() {
    return productTabRepository.getCategoriesAndBrandsUseCase();
  }
  
}