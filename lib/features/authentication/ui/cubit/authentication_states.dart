import 'package:ecommerce/features/authentication/domain/entity/sign_up_response_entity.dart';

abstract class AuthenticationStates {}
class AuthenticationInitialState extends AuthenticationStates {}
class AuthenticationLoadingState extends AuthenticationStates {}
class AuthenticationErrorState extends AuthenticationStates {
  final String error;
  AuthenticationErrorState({required this.error});
}
class SignupSuccessState extends AuthenticationStates {
  final SignUpResponseEntity? response;
  SignupSuccessState({this.response});
}