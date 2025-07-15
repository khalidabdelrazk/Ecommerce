import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_response_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failures, SignUpResponseEntity>> signUp(
    SignUpRequestBody requestBody,
  );
}
