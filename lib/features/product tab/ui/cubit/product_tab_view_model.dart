import 'package:ecommerce/features/product%20tab/domain/entity/get_products_request_body.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/get_products_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/entity/product_tabs_response_entity.dart';
import 'package:ecommerce/features/product%20tab/domain/use_case/get_categories_and_brands_use_case.dart';
import 'package:ecommerce/features/product%20tab/domain/use_case/get_products_use_case.dart';
import 'package:ecommerce/features/product%20tab/ui/cubit/product_tab_states.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends HydratedCubit<ProductTabStates> {
  final GetCategoriesAndBrandsUseCase getCategoriesAndBrandsUseCase;
  final GetProductsUseCase getProductsUseCase;

  ProductTabViewModel(
    this.getCategoriesAndBrandsUseCase,
    this.getProductsUseCase,
  ) : super(ProductTabInitialState());

  CategoryAndBrandsEntity selectedCategory = CategoryAndBrandsEntity();
  List<CategoryAndBrandsEntity> categories = [CategoryAndBrandsEntity(name: 'All')];
  bool isHidden = false;
  Map<String, List<ProductEntity>> items = {};
  Map<String, int> currentPage = {};
  Map<String, bool> isLastPage = {};

  void toggleVisibility() {
    isHidden = !isHidden;
    emit(ProductTabInitialState());
  }

  void selectCategory(CategoryAndBrandsEntity category) {
    if (selectedCategory == category) return;
    selectedCategory = category;
    emit(CategorySelectedState(selectedCategory.name ?? ''));
    fetchItems(reset: true);
  }

  void getCategoriesAndBrands() {
    if (categories.length > 1) {
      emit(ProductTabsSuccessState(responseEntity: ProductTabsResponseEntity(data: categories)));
      return;
    }

    emit(ProductTabLoadingState());
    getCategoriesAndBrandsUseCase.invoke().then((result) {
      result.fold(
        (failure) => emit(ProductsErrorState(failures: failure)),
        (response) {
          categories = (response.data ?? []).cast<CategoryAndBrandsEntity>();
          if (!categories.any((e) => e.name == 'All')) {
            categories.insert(0, CategoryAndBrandsEntity(name: 'All'));
          }
          selectedCategory = categories.isNotEmpty ? categories.first : CategoryAndBrandsEntity(name: 'All');
          emit(ProductTabsSuccessState(responseEntity: response));
        },
      );
    });
  }

  void fetchItems({bool reset = false}) {
    final key = generateKey(selectedCategory);

    if (reset) {
      items.remove(key);
      currentPage[key] = 1;
      isLastPage[key] = false;
    }

    if (isLastPage[key] == true) return;

    emit(ProductTabLoadingState());

    final page = currentPage[key] ?? 1;

    final getProductsRequestBody = selectedCategory.type == "Category"
        ? GetProductsRequestBody(categoryIn: selectedCategory.id, page: page)
        : GetProductsRequestBody(brand: selectedCategory.id, page: page);

    getProductsUseCase.invoke(requestBody: getProductsRequestBody).then((result) {
      result.fold(
        (failure) => emit(ProductTabsErrorState(failures: failure)),
        (response) {
          final fetchedProducts = response.data ?? [];
          if (fetchedProducts.isEmpty) {
            isLastPage[key] = true;
          } else {
            items[key] = [...(items[key] ?? []), ...fetchedProducts];
            currentPage[key] = page + 1;
          }
          emit(ProductsSuccessState(responseEntity: response));
        },
      );
    });
  }

  String generateKey(CategoryAndBrandsEntity category) {
    return '${category.id ?? 'all'}_${category.type ?? 'all'}';
  }

  @override
  Map<String, dynamic>? toJson(ProductTabStates state) {
    return {
      'categories': categories.map((e) => e.toJson()).toList(),
      'selectedCategory': selectedCategory.toJson(),
      'isHidden': isHidden,
      'items': items.map((key, value) => MapEntry(key, value.map((e) => e.toJson()).toList())),
    };
  }

  @override
  ProductTabStates? fromJson(Map<String, dynamic> json) {
    try {
      categories = (json['categories'] as List).map((e) => CategoryAndBrandsEntity.fromJson(e)).toList();
      if (!categories.any((e) => e.name == 'All')) {
        categories.insert(0, CategoryAndBrandsEntity(name: 'All'));
      }
      selectedCategory = CategoryAndBrandsEntity.fromJson(json['selectedCategory']);
      isHidden = json['isHidden'] ?? false;
      final itemsMap = (json['items'] as Map<String, dynamic>?) ?? {};
      items = itemsMap.map((key, value) => MapEntry(
            key,
            (value as List).map((e) => ProductEntity.fromJson(e)).toList(),
          ));
      return ProductTabsSuccessState(responseEntity: ProductTabsResponseEntity(data: categories));
    } catch (_) {
      return null;
    }
  }
}
