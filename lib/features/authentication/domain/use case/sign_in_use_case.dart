import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_in_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/authentication_response_entity.dart';
import 'package:ecommerce/features/authentication/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  final AuthenticationRepository authenticationRepository;
  SignInUseCase(this.authenticationRepository);

  Future<Either<Failures, AuthenticationResponseEntity>> signIn(
    SignInRequestBody requestBody,
  ) {
    return authenticationRepository.signIn(requestBody);
  }
}
