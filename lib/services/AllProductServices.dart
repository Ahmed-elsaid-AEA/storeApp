import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/shared/Constants.dart';

import '../models/ProductModel.dart';
import 'package:http/http.dart' as http;

class AllProductServices {
  String baseUrl = "https://fakestoreapi.com/";

  Future<List<ProductModel>> getAllProdects() async {
    List<dynamic> data  = await Api().get(url: "${KbaseUrl}products");
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
