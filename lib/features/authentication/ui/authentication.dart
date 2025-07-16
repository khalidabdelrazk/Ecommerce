import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_states.dart';
import 'package:ecommerce/features/authentication/ui/cubit/authentication_view_model.dart';
import 'package:ecommerce/features/authentication/ui/sign%20in/sign_in.dart';
import 'package:ecommerce/features/authentication/ui/sign%20up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationViewModel>(
      create: (_) => getIt<AuthenticationViewModel>(),
      child: BlocBuilder<AuthenticationViewModel, AuthenticationStates>(
        builder: (context, state) {
          final authenticationViewModel = context.read<AuthenticationViewModel>();

          return Scaffold(
            body: state.isLogin
                    ? SignIn(authenticationViewModel: authenticationViewModel)
                    : SignUp(authenticationViewModel: authenticationViewModel),
          );
        },
      ),
    );
  }
}
