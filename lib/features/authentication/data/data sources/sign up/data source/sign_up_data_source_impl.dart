import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api%20manager/api_endpints.dart';
import 'package:ecommerce/core/api%20manager/api_manager.dart';
import 'package:ecommerce/features/authentication/data/data%20sources/sign%20up/sign_up_data_source.dart';
import 'package:ecommerce/features/authentication/data/models/sign_up_response_dm.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImpl extends SignUpDataSource {
  final ApiManager apiManager;
  SignUpDataSourceImpl({required this.apiManager});

  @override
  Future<Either<String, SignUpResponseDm>> signUp(
    SignUpRequestBody requestBody,
  ) async {
    try {
      final response = await apiManager.postData(
        path: ApiEndPoints.register,
        data: requestBody.toJson(),
      );
      return Right(SignUpResponseDm.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}