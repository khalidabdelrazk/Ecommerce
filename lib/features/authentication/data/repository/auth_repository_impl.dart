import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failures.dart';
import 'package:ecommerce/features/authentication/data/data%20sources/sign%20up/sign_up_data_source.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_response_entity.dart';
import 'package:ecommerce/features/authentication/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthRepositoryImpl extends AuthenticationRepository {
  final SignUpDataSource signUpDataSource;
  AuthRepositoryImpl({required this.signUpDataSource});
  @override
  Future<Either<Failures, SignUpResponseEntity>> signUp(
    SignUpRequestBody requestBody,
  ) {
    return signUpDataSource.signUp(requestBody);
  }
}
