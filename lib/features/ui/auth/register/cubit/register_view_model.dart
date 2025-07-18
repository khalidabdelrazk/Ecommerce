
import 'package:ecommerce/domain/use_cases/register_use_case.dart';
import 'package:ecommerce/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUserCase;

  RegisterViewModel({required this.registerUserCase})
      : super(RegisterInitialState());

  //todo: hold data - handle logic
  TextEditingController fullNameController =
      TextEditingController(text: 'Amira');
  TextEditingController phoneController =
      TextEditingController(text: '01234567896');
  TextEditingController mailController =
      TextEditingController(text: 'amira888@route.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Amira123456');
  TextEditingController rePasswordController =
      TextEditingController(text: 'Amira123456');
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUserCase.invoke(
          fullNameController.text,
          mailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      either.fold((error) {
        emit(RegisterErrorState(errors: error));
      }, (response) {
        emit(RegisterSuccessState(responseEntity: response));
      });
    }
  }
}
