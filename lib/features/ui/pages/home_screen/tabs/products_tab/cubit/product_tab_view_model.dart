
import 'package:ecommerce/domain/entities/ProductResponseEntity.dart';
import 'package:ecommerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductTabViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductTabInitialState());

  //todo: hold data - handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductTabViewModel get(context) =>
      BlocProvider.of<ProductTabViewModel>(context);

  void getAllProducts() async {
    emit(ProductTabLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductTabErrorState(failures: error));
    }, (response) {
      productsList = response.data!;
      emit(ProductTabSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(failures: error));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      if (kDebugMode) {
        print('numOfCartItems: $numOfCartItems');
      }
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}
