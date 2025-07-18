import 'package:ecommerce/domain/use_cases/login_use_case.dart';
import 'package:ecommerce/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUserCase;

  LoginViewModel({required this.loginUserCase}) : super(LoginInitialState());

  //todo: hold data - handle logic

  TextEditingController mailController =
      TextEditingController(text: 'amira888@route.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Amira123456');
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUserCase.invoke(
        mailController.text,
        passwordController.text,
      );
      either.fold((error) {
        emit(LoginErrorState(errors: error));
      }, (response) {
        emit(LoginSuccessState(responseEntity: response));
      });
    }
  }
}
