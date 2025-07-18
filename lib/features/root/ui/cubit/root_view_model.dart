import 'package:ecommerce/features/home%20tab/ui/home_tab.dart';
import 'package:ecommerce/features/product%20tab/ui/product_tab.dart';
import 'package:ecommerce/features/root/ui/cubit/root_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RootViewModel extends Cubit<RootStates> {
  RootViewModel() : super(RootInitialState());

  //todo: hold data - handle logic
  int selectedIndex = 1;
  List<Widget> bodyList = const [
    HomeTab(),
    ProductTab(),
    Scaffold(body: Center(child: Text('Favorites'))),
    Scaffold(body: Center(child: Text('User'))),
  ];

  void bottomNavOnTap(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      emit(RootChangeSelectedIndexState());
    }
  }
}
