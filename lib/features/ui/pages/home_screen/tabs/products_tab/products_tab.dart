
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/flutter_toast.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/products_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_routes.dart';
import '../../../../widgets/product_tab_item.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});

  // ProductTabViewModel viewModel = getIt<ProductTabViewModel>();
  // @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductTabViewModel, ProductTabStates>(
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          ToastMessage.toastMsg(
              'added successfully', AppColors.greenColor, AppColors.whiteColor);
        } else if (state is AddToCartErrorState) {
          ToastMessage.toastMsg(state.failures.errorMessage, AppColors.redColor,
              AppColors.whiteColor);
        }
      },
      bloc: ProductTabViewModel.get(context)..getAllProducts(),
      buildWhen: (previous, current) {
        return current is AddToCartSuccessState ||
            current is AddToCartErrorState ||
            current is ProductTabSuccessState ||
            current is ProductTabErrorState;
      },
      builder: (context, state) {
        // return viewModel.productsList.isEmpty?
        //     const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):
        //     Text(viewModel.productsList.length.toString());
        if (state is ProductTabErrorState) {
          return Center(
            child: Text(state.failures.errorMessage),
          );
        } else if (state is ProductTabSuccessState) {
          return SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3.2.h,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h),
                itemCount: state.responseEntity.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      //todo: navigate to product details screen
                      Navigator.pushNamed(context, AppRoutes.productRoute,
                          arguments: state.responseEntity.data![index]);
                    },
                    child: ProductTabItem(
                      product: state.responseEntity.data![index],
                    ),
                  );
                },
              ))
            ],
          ));
        } else if (state is ProductTabLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
        return SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.2.h,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h),
              itemCount: ProductTabViewModel.get(context).productsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: navigate to product details screen
                    Navigator.pushNamed(context, AppRoutes.productRoute,
                        arguments: ProductTabViewModel.get(context)
                            .productsList[index]);
                  },
                  child: ProductTabItem(
                    product:
                        ProductTabViewModel.get(context).productsList[index],
                  ),
                );
              },
            ))
          ],
        ));
      },
    );
  }
}
