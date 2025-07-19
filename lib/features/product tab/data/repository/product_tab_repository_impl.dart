import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/product%20tab/data/data%20source/tabs/product_tabs_data_source.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/repository/product_tab_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductTabRepository)
class ProductTabRepositoryImpl implements ProductTabRepository {
  ProductTabsDataSource productTabsDataSource;
  ProductTabRepositoryImpl({required this.productTabsDataSource});
  @override
  Future<Either<Failures, ProductTabsResponseEntity>>
  getCategoriesAndBrandsUseCase() {
    return productTabsDataSource.getCategoriesAndBrandsUseCase();
  }
}
