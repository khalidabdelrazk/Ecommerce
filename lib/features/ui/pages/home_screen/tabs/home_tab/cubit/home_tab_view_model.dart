import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/utils/app_assets.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandesUseCase getAllBrandesUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandesUseCase})
      : super(HomeTabInitialState());

  //todo: hold data - handle logic
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<String> images = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (response) {
      categoriesList = response.data!;
      emit(CategorySuccessState(responseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandesUseCase.invoke();
    either.fold((error) {
      emit(BrandErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      emit(BrandSuccessState(responseEntity: response));
    });
  }
}
