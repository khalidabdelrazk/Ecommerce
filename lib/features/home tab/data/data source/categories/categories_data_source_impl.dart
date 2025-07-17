import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/home%20tab/data/data%20source/categories/categories_data_source.dart';
import 'package:ecommerce/features/home%20tab/data/model/category_response_dm.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource {
  final ApiManager apiManager;
  final NetworkInfo networkInfo;

  CategoriesDataSourceImpl({required this.apiManager, required this.networkInfo});

  @override
  Future<Either<Failures, CategoriesResponseDm>> getCategories() async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }
    try {
      final response = await apiManager.getData(
        path: ApiEndPoints.getAllCategories,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => true,
        ),
      );
      CategoriesResponseDm categoriesResponse =
          CategoriesResponseDm.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(categoriesResponse);
      }
      return Left(
        ServerError(
          errorMessage: "Failed to get categories: ${categoriesResponse.message}",
        ),
      );
    } catch (e) {
      print("Error in CategoriesDataSourceImpl: $e");
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
