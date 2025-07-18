import 'package:ecommerce/core/helpers/app_assets.dart';
import 'package:ecommerce/features/home%20tab/domain/entity/categories_or_brands_response_entity.dart';
import 'package:ecommerce/features/home%20tab/domain/use%20case/brands_use_case.dart';
import 'package:ecommerce/features/home%20tab/domain/use%20case/categories_use_case.dart';
import 'package:ecommerce/features/home%20tab/ui/cubit/home_states.dart';
import 'package:injectable/injectable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

@injectable
class HomeViewModel extends HydratedCubit<HomeStates> {
  final CategoriesUseCase categoriesUseCase;
  final BrandsUseCase brandsUseCase;

  HomeViewModel({required this.brandsUseCase, required this.categoriesUseCase})
    : super(HomeInitialState());

  List<CategoryOrBrandsEntity> categories = [];
  List<CategoryOrBrandsEntity> brands = [];

  List<String> images = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  void getCategories() {
    if (state is CategorySuccessState && categories.isNotEmpty) return;
    emit(CategoryLoadingState());
    categoriesUseCase.invoke().then((result) {
      result.fold((failure) => emit(CategoryErrorState(failures: failure)), (
        categoriesResponse,
      ) {
        categories = categoriesResponse.data ?? [];
        emit(CategorySuccessState(responseEntity: categoriesResponse));
      });
    });
  }

  void getBrands() {
    if (state is BrandSuccessState && brands.isNotEmpty) return;
    emit(BrandsLoadingState());
    brandsUseCase.invoke().then((result) {
      result.fold((failure) => emit(BrandsErrorState(failures: failure)), (
        brandsResponse,
      ) {
        emit(BrandSuccessState(responseEntity: brandsResponse));
      });
    });
  }

  @override
  Map<String, dynamic>? toJson(HomeStates state) {
    if (state is CategorySuccessState) {
      return {
        'categories': state.responseEntity.data
            ?.map((e) => e.toJson())
            .toList(),
      };
    } else if (state is BrandSuccessState) {
      return {
        'brands': state.responseEntity.data?.map((e) => e.toJson()).toList(),
      };
    }
    return null;
  }

  @override
  HomeStates? fromJson(Map<String, dynamic> json) {
    try {
      if (json.containsKey('categories')) {
        final cachedCategories = (json['categories'] as List)
            .map((e) => CategoryOrBrandsEntity.fromJson(e))
            .toList();
        categories = cachedCategories;
        return CategorySuccessState(
          responseEntity: CategoriesOrBrandsResponseEntity(
            data: cachedCategories,
          ),
        );
      } else if (json.containsKey('brands')) {
        final cachedBrands = (json['brands'] as List)
            .map((e) => CategoryOrBrandsEntity.fromJson(e))
            .toList();
        return BrandSuccessState(
          responseEntity: CategoriesOrBrandsResponseEntity(data: cachedBrands),
        );
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
