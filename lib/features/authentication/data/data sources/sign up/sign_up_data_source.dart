import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/authentication/data/models/sign_up_response_dm.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';

abstract class SignUpDataSource {
  Future<Either<String, SignUpResponseDm>> signUp(
    SignUpRequestBody requestBody,
  );  
}