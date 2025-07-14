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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    print("Password Visibility: $isPasswordVisible");
    emit(AuthenticationInitialState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    print("Confirm Password Visibility: $isConfirmPasswordVisible");
    emit(AuthenticationInitialState());
  }

  /// Method to validate the form
  void signup() {
    if (formKey.currentState?.validate() ?? false) {
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
