import 'package:ecommerce/core/api%20manager/api_constants.dart';

abstract class ApiEndPoints {
  static const String register = '${ApiConstants.baseUrl}/api/v1/auth/signup';
  static const String signIn = '${ApiConstants.baseUrl}/api/v1/auth/signin';
  static const String getAllCategories =
      '${ApiConstants.baseUrl}/api/v1/categories';
  static const String getAllBrands = '${ApiConstants.baseUrl}/api/v1/brands';
  static const String getAllProducts =
      '${ApiConstants.baseUrl}/api/v1/products';
  static const String addToCart = '${ApiConstants.baseUrl}/api/v1/cart';
}
