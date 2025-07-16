import 'package:ecommerce/features/authentication/domain/entity/authentication_response_entity.dart';

abstract class AuthenticationStates {
  final bool isLogin;
  const AuthenticationStates({required this.isLogin});
}

class AuthenticationInitialState extends AuthenticationStates {
  const AuthenticationInitialState({required super.isLogin});
}

class AuthenticationLoadingState extends AuthenticationStates {
  const AuthenticationLoadingState({required super.isLogin});
}

class AuthenticationErrorState extends AuthenticationStates {
  final String error;
  const AuthenticationErrorState({required this.error, required super.isLogin});
}

class AuthenticationSuccessState extends AuthenticationStates {
  final AuthenticationResponseEntity? response;
  const AuthenticationSuccessState({this.response, required super.isLogin});
}
