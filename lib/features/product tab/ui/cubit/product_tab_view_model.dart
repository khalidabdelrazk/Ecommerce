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
  List<CategoryAndBrandsEntity> categories = [];
  bool isHidden = false;
  Map<String, ProductEntity> items = {};

  void toggleVisibility() {
    isHidden = !isHidden;
    emit(ProductTabInitialState());
  }

  void selectCategory(CategoryAndBrandsEntity category) {
    if (selectedCategory == category) return;
    selectedCategory = category;
    emit(CategorySelectedState(selectedCategory.name ?? ''));
    fetchItems();
  }

  void getCategoriesAndBrands() {
    if (categories.isNotEmpty) {
      emit(
        ProductTabsSuccessState(
          responseEntity: ProductTabsResponseEntity(data: categories),
        ),
      );
      return;
    }

    emit(ProductTabLoadingState());
    getCategoriesAndBrandsUseCase.invoke().then((result) {
      result.fold(
        (failure) => emit(ProductsErrorState(failures: failure)),
        (response) {
          categories = (response.data ?? []).cast<CategoryAndBrandsEntity>();
          selectedCategory = categories.isNotEmpty
              ? categories.first
              : CategoryAndBrandsEntity();
          emit(ProductTabsSuccessState(responseEntity: response));
        },
      );
    });
  }

  void fetchItems() {
    final key = selectedCategory.name ?? '';
    if (items.containsKey(key)) {
      emit(
        ProductsSuccessState(
          responseEntity: GetProductsResponseEntity(
            data: [items[key]!],
          ),
        ),
      );
      return;
    }

    emit(ProductTabLoadingState());

    final getProductsRequestBody = selectedCategory.type == "Catergory"
        ? GetProductsRequestBody(categoryIn: selectedCategory.id)
        : GetProductsRequestBody();

    getProductsUseCase.invoke(requestBody: getProductsRequestBody).then((result) {
      result.fold(
        (failure) => emit(ProductTabsErrorState(failures: failure)),
        (response) {
          if (response.data != null && response.data!.isNotEmpty) {
            items[key] = response.data!.first;
          }
          emit(ProductsSuccessState(responseEntity: response));
        },
      );
    });
  }

  @override
  Map<String, dynamic>? toJson(ProductTabStates state) {
    return {
      'categories': categories.map((e) => e.toJson()).toList(),
      'selectedCategory': selectedCategory.toJson(),
      'isHidden': isHidden,
      'items': items.map((key, value) => MapEntry(key, value.toJson())),
    };
  }

  @override
  ProductTabStates? fromJson(Map<String, dynamic> json) {
    try {
      categories = (json['categories'] as List)
          .map((e) => CategoryAndBrandsEntity.fromJson(e))
          .toList();

      selectedCategory = CategoryAndBrandsEntity.fromJson(json['selectedCategory']);
      isHidden = json['isHidden'] ?? false;

      final itemsMap = (json['items'] as Map<String, dynamic>?) ?? {};
      items = itemsMap.map((key, value) => MapEntry(key, ProductEntity.fromJson(value)));

      return ProductTabsSuccessState(
        responseEntity: ProductTabsResponseEntity(data: categories),
      );
    } catch (_) {
      return null;
    }
  }
}
