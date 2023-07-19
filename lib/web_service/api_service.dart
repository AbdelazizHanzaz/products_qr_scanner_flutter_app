import 'dart:developer';

import 'package:dio/dio.dart';

import '../data/models/category.dart';
import '../data/models/product.dart';

class APIService {

  static final Dio _dio = Dio();

  APIService(){
    _dio.options = BaseOptions(
        baseUrl : "http://localhost/api/v1/apikey",
        headers: {

        },
    );
  }

  // Get categories
  static Future<List<Category>> getCategories() async {
    try {
      Response response = await _dio.get('/categories');
      return response.data
          .map((json) => Category.fromJson(json))
          .toList();
    } catch (error) {
      log("Error is : $error");
      throw Exception('Failed to load categories');
    }
  }

  // Get featured products
  static Future<List<Product>> getFeaturedProducts() async {
    try {
      Response response = await _dio.get('/products/featured');
      return response.data
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (error) {
      log("Eroor : $error");
      throw Exception('Failed to load featured products');
    }
  }

  // Get recent products
  static Future<List<Product>> getRecentProducts() async {
    try {
      Response response = await _dio.get('/products/recent');
      return response.data
          .map((json) => Product.fromJson(json))
          .toList();
    } catch (error) {
      log("Error: $error");
      throw Exception('Failed to load recent products');
    }
  }


  // APIService

static Future<Product> getProductByBarcode(String barcode) async {

  final response = await _dio.get('/products/lookup', queryParameters: {
    'barcode': barcode
  });

  if (response.statusCode == 200) {
    return Product.fromJson(response.data);
  } else {
    throw Exception('Failed to load product');
  }

}

}