import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/authentication_response_entity.dart';
import 'package:ecommerce/features/authentication/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  final AuthenticationRepository authenticationRepository;
  SignUpUseCase(this.authenticationRepository);

  Future<Either<Failures, AuthenticationResponseEntity>> signUp(
    SignUpRequestBody requestBody,
  ) {
    return authenticationRepository.signUp(requestBody);
  }
}
