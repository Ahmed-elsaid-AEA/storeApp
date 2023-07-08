import 'dart:convert';

import 'package:store_app/helper/api.dart';
import 'package:store_app/shared/Constants.dart';

import '../models/ProductModel.dart';
import 'package:http/http.dart' as http;

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: "${KbaseUrl}products ", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
    return ProductModel.fromJson(data);
  }
}
