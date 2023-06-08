import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_api/models/post_request.dart';

import 'models/get_products_response_model.dart';

class DioHelper {
  DioHelper._();
  static DioHelper dioHelper = DioHelper._();
  Dio dio = Dio();
  Future<List<Product>> getAllProducts() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    List responseList = response.data;
    List<Product> products = responseList.map((e) {
      return Product.fromJson(e);
    }).toList();
    log(products.length.toString());
    return products;
  }

  Future<List<String>> getAllCategories() async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/categories');
    List cats = response.data;
    List<String> categories = cats.map((e) => e.toString()).toList();
    return categories;
  }

  Future<List<Product>> getCategoryProducts(String category) async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/category/$category');
    List responseList = response.data;
    List<Product> products = responseList.map((e) {
      return Product.fromJson(e);
    }).toList();
    log('num of product = ' + products.length.toString());
    return products;
  }

  getOneProduct(int id) async {
    Response response = await dio.get('https://fakestoreapi.com/products/$id');
    return Product.fromJson(response.data);
  }

  createNewPost(PostRequest postRequest) async {
    Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: postRequest.toJson());
    log(response.data.toString());
  }
}
