import 'package:ecommerce/features/authentication/domain/entity/sign_up_request_body.dart';
import 'package:ecommerce/features/authentication/domain/use%20case/sign_up_use_case.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthenticationViewModel extends Cubit<AuthenticationStates> {
  final SignUpUseCase signUpUseCase;

  AuthenticationViewModel({required this.signUpUseCase})
    : super(AuthenticationInitialState());

  final formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController(text: 'Ahmed Abd Al-Muti');
  TextEditingController emailController = TextEditingController(text: 'khalidaa@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'password123@');
  TextEditingController confirmPasswordController = TextEditingController(text: 'password123@');
  TextEditingController phoneController = TextEditingController(text: '01010123456');

  /// Method to validate the form
  void signup() {
    if (formKey.currentState?.validate() == true) {
      emit(AuthenticationLoadingState());

      SignUpRequestBody requestBody = SignUpRequestBody(
        name: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        phone: phoneController.text,
      );
      signUpUseCase.signUp(requestBody).then((result) {
        result.fold(
          (failure) =>
              emit(AuthenticationErrorState(error: failure.errorMessage)),
          (success) => emit(SignupSuccessState(response: success)),
        );
      });
    }
  }
}
