import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_in_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/authentication_response_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failures, AuthenticationResponseEntity>> signUp(
    SignUpRequestBody requestBody,
  );
  Future<Either<Failures, AuthenticationResponseEntity>> signIn(
    SignInRequestBody requestBody,
  );
}
