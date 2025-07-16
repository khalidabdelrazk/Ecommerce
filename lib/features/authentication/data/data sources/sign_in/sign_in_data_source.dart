import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/data/models/authentication_response_dm.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_in_request_body.dart';

abstract class SignInDataSource {
  Future<Either<Failures, AuthenticationResponseDm>> signIn(
    SignInRequestBody requestBody,
  );
}
