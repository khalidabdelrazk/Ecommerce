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

  // Initial category and items
  String selectedCategory = '';
  List<String> items = [];
  final List<String> categories = [];
  List<CategoryAndBrandsEntity> categories2 = [];

  String categoryId = '64089fe824b25627a25315d1';

  void selectCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      fetchItems(category);
      emit(CategorySelectedState(selectedCategory));
      // Simulate a delay for loading state
      Future.delayed(const Duration(seconds: 1), () {
        emit(ProductTabInitialState());
      });
    }
  }

  void getCategoriesAndBrands() {
    // if (state is ProductTabsSuccessState && categories2.isNotEmpty) return;
    emit(ProductTabLoadingState());
    getCategoriesAndBrandsUseCase.invoke().then((result) {
      result.fold((failure) => emit(ProductTabsErrorState(failures: failure)), (
        response,
      ) {
        categories2 = (response.data ?? []).cast<CategoryAndBrandsEntity>();
        selectedCategory = categories2.isNotEmpty ? categories2.first.name ?? '' : '';
        print(selectedCategory);
        fetchItems(selectedCategory);
        emit(ProductTabsSuccessState(responseEntity: response));
      });
    });
  }

  void fetchItems(String category) {
    items = List.generate(10, (index) => '$category Item $index');
  }

 @override
  Map<String, dynamic>? toJson(ProductTabStates state) {
    if (state is ProductTabsSuccessState) {
      return {
        'categories': state.responseEntity.data
            ?.map((e) => e.toJson())
            .toList(),
      };
    }
    return null;
  }

  @override
  ProductTabStates? fromJson(Map<String, dynamic> json) {
    try {
      if (json.containsKey('categories')) {
        final cachedCategories = (json['categories'] as List)
            .map((e) => CategoryAndBrandsEntity.fromJson(e))
            .toList();
        categories2 = cachedCategories;
        return ProductTabsSuccessState(
          responseEntity: ProductTabsResponseEntity(
            data: cachedCategories,
          ),
        );
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
