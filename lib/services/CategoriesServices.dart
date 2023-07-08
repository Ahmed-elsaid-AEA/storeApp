import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/shared/Constants.dart';

import '../models/ProductModel.dart';
import 'package:http/http.dart' as http;

class CategoriesServices {
  String baseUrl = "https://fakestoreapi.com/";

  Future<List<ProductModel>> getCategoriesProdects(
      {required String category_name}) async {
    Uri uri = Uri.parse("${KbaseUrl}products/category/$category_name");
    http.Response response = await http.get(uri);
    List<dynamic> data =
        await Api().get(url: "${KbaseUrl}products/category/$category_name");
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
