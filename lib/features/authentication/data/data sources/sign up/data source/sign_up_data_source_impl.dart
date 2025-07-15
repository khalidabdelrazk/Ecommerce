import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/data/data%20sources/sign%20up/sign_up_data_source.dart';
import 'package:ecommerce/features/authentication/data/models/sign_up_response_dm.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:injectable/injectable.dart';

import 'package:ecommerce/core/network/network_info.dart'; // Assuming you place NetworkInfo here

@LazySingleton(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource {
  final ApiManager apiManager;
  final NetworkInfo networkInfo;

  SignUpDataSourceImpl({required this.apiManager, required this.networkInfo});

  @override
  Future<Either<Failures, SignUpResponseDm>> signUp(
    SignUpRequestBody requestBody,
  ) async {
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }
    try {
      final response = await apiManager.postData(
        path: ApiEndPoints.register,
        data: requestBody.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => true,
        ),
      );
      SignUpResponseDm registerResponse = SignUpResponseDm.fromJson(
        response.data,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(registerResponse);
      }
      return Left(
        ServerError(
          errorMessage: registerResponse.errors != null
              ? "Failed to register: ${registerResponse.errors?.param} ${registerResponse.errors?.msg}"
              : "Failed to register : ${registerResponse.message}",
        ),
      );
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
