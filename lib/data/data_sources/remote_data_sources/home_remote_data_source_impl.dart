import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/cache/shared_preference_utils.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/data/model/AddCartResponseDm.dart';
import 'package:ecommerce/domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api/end_poinst.dart';
import '../../model/CategoryOrBrandResponseDm.dart';
import '../../model/ProductResponseDm.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllCategories);
        var categoryResponse =
            CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllBrands);
        var brandResponse = CategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMessage: brandResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllProducts);
        var productResponse = ProductResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddCartResponseDm>> addToCart(
      String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(
            endPoint: EndPoints.addToCart,
            body: {'productId': productId},
            headers: {'token': token});
        var productResponse = AddCartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
