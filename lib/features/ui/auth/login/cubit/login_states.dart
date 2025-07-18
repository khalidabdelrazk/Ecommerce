

import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures errors;

  LoginErrorState({required this.errors});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity responseEntity;

  LoginSuccessState({required this.responseEntity});
}
