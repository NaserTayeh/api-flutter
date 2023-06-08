import 'dart:developer';

import 'package:ecommerce_api/dio_helper.dart';
import 'package:ecommerce_api/models/get_products_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsProvider() {
    log('inside constructor');
    getAllProducts();
    getAllCategories();
  }
  List<Product>? products;
  List<String>? categories;
  Product? selectedProduct;
  String selectedCategory = 'all';
  getOneProduct(int id) async {
    selectedProduct = null;
    notifyListeners();
    selectedProduct = await DioHelper.dioHelper.getOneProduct(id);
    notifyListeners();
  }

  getAllProducts() async {
    products = await DioHelper.dioHelper.getAllProducts();
    notifyListeners();
  }

  getAllCategories() async {
    categories = await DioHelper.dioHelper.getAllCategories();
    notifyListeners();
  }

  selectCategory(String category) {
    selectedCategory = category;
    products = null;
    notifyListeners();
    if (category == 'all') {
      getAllProducts();
    } else {
      getCategoryProducts();
    }
  }

  getCategoryProducts() async {
    products = await DioHelper.dioHelper.getCategoryProducts(selectedCategory);
    notifyListeners();
  }
}
