

import 'package:ecommerce/core/helpers/app_assets.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {

  HomeViewModel()
      : super(HomeInitialState());

  //todo: hold data - handle logic
  List<String> images = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];
}
