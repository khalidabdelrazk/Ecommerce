import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/data/data%20source/products/product_data_source.dart';
import 'package:ecommerce/features/product%20tab/data/data%20source/tabs/product_tabs_data_source.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_request_body.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/repository/product_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductTabRepository)
class ProductTabRepositoryImpl implements ProductTabRepository {
  ProductTabsDataSource productTabsDataSource;
  ProductDataSource productDataSource;
  ProductTabRepositoryImpl({
    required this.productTabsDataSource,
    required this.productDataSource,
  });
  @override
  Future<Either<Failures, ProductTabsResponseEntity>>
  getCategoriesAndBrandsUseCase() {
    return productTabsDataSource.getCategoriesAndBrandsUseCase();
  }

  @override
  Future<Either<Failures, GetProductsResponseEntity>> getProducts({
    required GetProductsRequestBody requestBody,
  }) {
    return productDataSource.getProducts(requestBody: requestBody);
  }
}
