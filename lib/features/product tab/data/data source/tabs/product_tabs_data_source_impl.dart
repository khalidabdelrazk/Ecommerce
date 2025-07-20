import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/product%20tab/data/data%20source/tabs/product_tabs_data_source.dart';
import 'package:ecommerce/features/product%20tab/data/model/product_tabs_response_dm.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductTabsDataSource)
class ProductTabsDataSourceImpl extends ProductTabsDataSource {
  ApiManager apiManager;
  NetworkInfo networkInfo;

  ProductTabsDataSourceImpl({
    required this.apiManager,
    required this.networkInfo,
  });

  @override
  Future<Either<Failures, ProductTabsResponseDm>>
  getCategoriesAndBrandsUseCase() async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }

    try {
      final responseBrands = await apiManager.getData(
        path: ApiEndPoints.getAllBrands,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => true,
        ),
      );

      final responseCategories = await apiManager.getData(
        path: ApiEndPoints.getAllCategories,
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => true,
        ),
      );

      if (responseBrands.statusCode! >= 200 &&
          responseBrands.statusCode! < 300 &&
          responseCategories.statusCode! >= 200 &&
          responseCategories.statusCode! < 300) {
        final combinedResponse = ProductTabsResponseDm.fromJson(
          responseCategories.data,
          "Category",
          responseBrands.data,
          "brands",
        );

        return Right(combinedResponse);
      }

      return Left(
        ServerError(
          errorMessage:
              "Failed to get categories or brands.\nCategories Status: ${responseCategories.statusCode}, Brands Status: ${responseBrands.statusCode}",
        ),
      );
    } catch (e) {
      print("Error in ProductTabsDataSourceImpl: $e");
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
