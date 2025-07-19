import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api_manager.dart';
import 'package:ecommerce/core/api/end_poinst.dart';
import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/data/model/RegisterResponseDM.dart';
import 'package:ecommerce/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../model/LoginResponseDm.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.other) ||
          connectivityResult.contains(ConnectivityResult.ethernet) ||
          connectivityResult.contains(ConnectivityResult.bluetooth) ||
          !connectivityResult.contains(ConnectivityResult.none) ||
          connectivityResult.contains(ConnectivityResult.vpn) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response =
            await apiManager.postData(endPoint: EndPoints.signUp, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage:
                'No Internet Connection, Please check internet connection.'));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDm>> login(
      String email, String password) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.other) ||
          connectivityResult.contains(ConnectivityResult.ethernet) ||
          connectivityResult.contains(ConnectivityResult.bluetooth) ||
          !connectivityResult.contains(ConnectivityResult.none) ||
          connectivityResult.contains(ConnectivityResult.vpn) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response =
            await apiManager.postData(endPoint: EndPoints.signIn, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: save token
          // SharedPreferenceUtils.saveData(key: 'token',
          //     value: loginResponse.token);
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
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
