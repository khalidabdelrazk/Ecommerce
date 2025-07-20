import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_request_body.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/repository/product_tab_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetProductsUseCase {
  ProductTabRepository productTabRepository;
  GetProductsUseCase({required this.productTabRepository});

  Future<Either<Failures, GetProductsResponseEntity>> invoke({
    required GetProductsRequestBody requestBody,
  }) {
    return productTabRepository.getProducts(requestBody: requestBody);
  }
}
