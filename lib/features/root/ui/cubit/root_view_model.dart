import 'package:ecommerce/features/root/ui/cubit/root_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class RootViewModel extends Cubit<RootStates> {
  RootViewModel() : super(RootInitialState());

  //todo: hold data - handle logic
  int selectedIndex = 0;
  List<Widget> bodyList = const [
    Scaffold(
      body: Center(child: Text('Home')),
    ),
    Scaffold(
      body: Center(child: Text('Products')),
    ),
    Scaffold(
      body: Center(child: Text('Favorites')),
    ),
    Scaffold(
      body: Center(child: Text('User')),
    ),
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(RootChangeSelectedIndexState());
  }
}
