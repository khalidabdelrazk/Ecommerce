
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/home%20tab/data/data%20source/categories/categories_data_source.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_response_entity.dart';
import 'package:ecommerce/features/home%20tab/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final CategoriesDataSource categoriesDataSource;

  HomeRepositoryImpl({required this.categoriesDataSource});

  @override
  Future<Either<Failures, CategoriesResponseEntity>> getCategories() async {
    final result = await categoriesDataSource.getCategories();
    return result.fold(
      (failure) => Left(failure),
      (categoriesResponse) => Right(categoriesResponse),
    );
  }
}
