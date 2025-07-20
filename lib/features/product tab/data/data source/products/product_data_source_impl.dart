import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/core/network/network_info.dart';
import 'package:ecommerce/features/product%20tab/data/data%20source/products/product_data_source.dart';
import 'package:ecommerce/features/product%20tab/data/model/get_poduct_reponse_dm.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_request_body.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImpl extends ProductDataSource {
  ApiManager apiManager;
  NetworkInfo networkInfo;

  ProductDataSourceImpl({required this.apiManager, required this.networkInfo});

  @override
  Future<Either<Failures, GetProductsResponseDm>> getProducts({required GetProductsRequestBody requestBody}) async{
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }
    try {
      final response = await apiManager.getData(
        path: ApiEndPoints.getAllProducts,
        queryParameters: requestBody.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => true,
        ),
      );
      print("Response from getProducts: ${response.data}");
      
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        GetProductsResponseDm responseData =
          GetProductsResponseDm.fromJson(response.data);
        return Right(responseData);
      }
      return Left(
        ServerError(
          errorMessage: "Failed to get products}",
        ),
      );
    } catch (e) {
      print("Error in ProductDataSourceImpl: $e");
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
