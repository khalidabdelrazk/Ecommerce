import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/data/data%20source/brands/brands_data_source.dart';
import 'package:ecommerce/features/home%20tab/data/data%20source/categories/categories_data_source.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';
import 'package:ecommerce/features/home%20tab/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final CategoriesDataSource categoriesDataSource;
  final BrandsDataSource brandsDataSource;

  HomeRepositoryImpl({required this.categoriesDataSource, required this.brandsDataSource});

  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>>
  getCategories() async {
    final result = await categoriesDataSource.getCategories();
    return result.fold(
      (failure) => Left(failure),
      (categoriesResponse) => Right(categoriesResponse),
    );
  }
  
  @override
  Future<Either<Failures, CategoriesOrBrandsResponseEntity>> getBrands() async {
    final result = await brandsDataSource.getBrands();
    return result.fold(
      (failure) => Left(failure),
      (brandsResponse) => Right(brandsResponse),
    );
  }
}
