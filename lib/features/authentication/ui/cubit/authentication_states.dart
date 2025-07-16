import 'package:ecommerce/features/authentication/domain/entity/authentication_response_entity.dart';

abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates {}

class AuthenticationLoadingState extends AuthenticationStates {}

class AuthenticationErrorState extends AuthenticationStates {
  final String error;
  AuthenticationErrorState({required this.error});
}

class AuthenticationSuccessState extends AuthenticationStates {
  final AuthenticationResponseEntity? response;
  AuthenticationSuccessState({this.response});
}
