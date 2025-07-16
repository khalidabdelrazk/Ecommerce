import 'package:ecommerce/features/authentication/domain/entity/sign_in_request_body.dart';
import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/use%20case/sign_in_use_case.dart';
import 'package:ecommerce/features/authentication/domain/use%20case/sign_up_use_case.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationViewModel extends Cubit<AuthenticationStates> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  AuthenticationViewModel({
    required this.signUpUseCase,
    required this.signInUseCase,
  }) : super(const AuthenticationInitialState(isLogin: true));

  final formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isLogin = true;

  void toggleLoginSignup() {
    isLogin = !isLogin;
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    emit(AuthenticationInitialState(isLogin: isLogin));
  }

  void signup() {
    if (formKey.currentState?.validate() == true) {
      emit(AuthenticationLoadingState(isLogin: isLogin));
      final requestBody = SignUpRequestBody(
        name: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        phone: phoneController.text,
      );
      signUpUseCase.signUp(requestBody).then((result) {
        result.fold(
          (failure) => emit(AuthenticationErrorState(error: failure.errorMessage, isLogin: isLogin)),
          (success) => emit(AuthenticationSuccessState(response: success, isLogin: isLogin)),
        );
      });
    }
  }

  void signIn() {
    if (formKey.currentState?.validate() == true) {
      emit(AuthenticationLoadingState(isLogin: isLogin));
      final requestBody = SignInRequestBody(
        email: emailController.text,
        password: passwordController.text,
      );
      signInUseCase.signIn(requestBody).then((result) {
        result.fold(
          (failure) => emit(AuthenticationErrorState(error: failure.errorMessage, isLogin: isLogin)),
          (success) => emit(AuthenticationSuccessState(response: success, isLogin: isLogin)),
        );
      });
    }
  }
}
