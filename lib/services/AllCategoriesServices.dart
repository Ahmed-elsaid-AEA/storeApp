import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/shared/Constants.dart';

import '../models/ProductModel.dart';
import 'package:http/http.dart' as http;

class AllCategoriesServices {
  String baseUrl = "https://fakestoreapi.com/";

  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: "${KbaseUrl}products/categories");
    return data;
  }
}
