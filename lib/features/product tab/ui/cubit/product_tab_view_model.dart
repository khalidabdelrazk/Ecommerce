import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/use_case/get_categories_and_brands_use_case.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_states.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends HydratedCubit<ProductTabStates> {
  final GetCategoriesAndBrandsUseCase getCategoriesAndBrandsUseCase;
  ProductTabViewModel(this.getCategoriesAndBrandsUseCase)
      : super(ProductTabInitialState());

  String selectedCategory = '';
  List<String> items = [];
  List<CategoryAndBrandsEntity> categories2 = [];
  bool isHidden = false;

  /// Toggle Category Sidebar Visibility
  void toggleVisibility() {
    isHidden = !isHidden;
    emit(ProductTabInitialState());
  }

  /// Select Category and Fetch its Items
  void selectCategory(String category) {
    if (selectedCategory == category) return;
    selectedCategory = category;
    emit(CategorySelectedState(selectedCategory));
    fetchItems();
  }

  /// Fetch Categories and Brands (only if not cached)
  void getCategoriesAndBrands() {
    if (categories2.isNotEmpty) {
      emit(ProductTabsSuccessState(
        responseEntity: ProductTabsResponseEntity(data: categories2),
      ));
      return;
    }

    emit(ProductTabLoadingState());
    getCategoriesAndBrandsUseCase.invoke().then((result) {
      result.fold(
        (failure) => emit(ProductTabsErrorState(failures: failure)),
        (response) {
          categories2 = (response.data ?? []).cast<CategoryAndBrandsEntity>();
          selectedCategory = categories2.isNotEmpty ? categories2.first.name ?? '' : '';
          emit(ProductTabsSuccessState(responseEntity: response));
        },
      );
    });
  }

  /// Fake Items Fetching based on Category
  void fetchItems() {
    items = List.generate(10, (index) => '$selectedCategory Item $index');
  }

  /// Persist Data
  @override
  Map<String, dynamic>? toJson(ProductTabStates state) {
    if (categories2.isNotEmpty) {
      return {
        'categories': categories2.map((e) => e.toJson()).toList(),
        'selectedCategory': selectedCategory,
        'isHidden': isHidden,
      };
    }
    return null;
  }

  @override
  ProductTabStates? fromJson(Map<String, dynamic> json) {
    try {
      final cachedCategories = (json['categories'] as List)
          .map((e) => CategoryAndBrandsEntity.fromJson(e))
          .toList();

      categories2 = cachedCategories;
      selectedCategory = json['selectedCategory'] ?? '';
      isHidden = json['isHidden'] ?? false;

      return ProductTabsSuccessState(
        responseEntity: ProductTabsResponseEntity(data: categories2),
      );
    } catch (_) {
      return null;
    }
  }
}
