import 'package:ecommerce/core/helpers/app_assets.dart';
import 'package:ecommerce/features/home%20tab/domain/use%20case/categories_use_case.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  final CategoriesUseCase categoriesUseCase;

  HomeViewModel({required this.categoriesUseCase}) : super(HomeInitialState());

  //todo: hold data - handle logic
  List<String> images = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  void getCategories() {
    // Implement the logic to fetch categories
    // For example, you can call a repository method here
    // and emit the appropriate states based on the result.
    emit(CategoryLoadingState());
    categoriesUseCase.invoke().then((result) {
      result.fold(
        (failure) {
          emit(CategoryErrorState(failures: failure));
        },
        (categoriesResponse) {
          emit(CategorySuccessState(responseEntity: categoriesResponse));
        },
      );
    });
  }
}
