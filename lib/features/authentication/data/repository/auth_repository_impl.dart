import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_response_entity.dart';
import 'package:ecommerce/features/authentication/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthenticationRepository)
class AuthRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either<Failures, SignUpResponseEntity>> signUp(SignUpRequestBody requestBody) {
    // TODO: Implement sign up logic
    throw UnimplementedError();
  }
}
