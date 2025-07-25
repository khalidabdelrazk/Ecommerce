import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_view_model.dart';
import 'package:ecommerce/features/home%20tab/ui/home_tab.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/product%20tab/ui/product_tab.dart';
import 'package:ecommerce/features/root/ui/cubit/root_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RootViewModel extends Cubit<RootStates> {
  HomeViewModel homeViewModel = getIt<HomeViewModel>();
  ProductTabViewModel productTabViewModel = getIt<ProductTabViewModel>();

  //todo: hold data - handle logic
  int selectedIndex = 1;
  late final List<Widget> bodyList;

  RootViewModel() : super(RootInitialState()) {
    bodyList = [
      HomeTab(viewModel: homeViewModel),
      ProductTab(productTabViewModel: productTabViewModel,),
      const Scaffold(body: Center(child: Text('Favorites'))),
      const Scaffold(body: Center(child: Text('User'))),
    ];
  }

  void bottomNavOnTap(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      emit(RootChangeSelectedIndexState());
    }
  }
}
