import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/data/data%20sources/sign%20in/sign_in_data_source.dart';
import 'package:ecommerce/features/authentication/data/data%20sources/sign%20up/sign_up_data_source.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_in_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/authentication_response_entity.dart';
import 'package:ecommerce/features/authentication/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthRepositoryImpl extends AuthenticationRepository {
  final SignUpDataSource signUpDataSource;
  final SignInDataSource signInDataSource;
  AuthRepositoryImpl({
    required this.signUpDataSource,
    required this.signInDataSource,
  });
  @override
  Future<Either<Failures, AuthenticationResponseEntity>> signUp(
    SignUpRequestBody requestBody,
  ) {
    return signUpDataSource.signUp(requestBody);
  }

  @override
  Future<Either<Failures, AuthenticationResponseEntity>> signIn(
    SignInRequestBody requestBody,
  ) {
    return signInDataSource.signIn(requestBody);
  }
}
