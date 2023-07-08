import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a proplem in statues code ${response.statusCode}');
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      /*body is the data that will you put */
      body: body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a proplem in statues code ${response.statusCode}');
    }
  } Future<dynamic> put({required String url, @required dynamic body}) async {
    print(url);
    http.Response response = await http.put(
      Uri.parse(url),
      /*body is the data that will you put */
      body: body,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a proplem in statues code ${response.statusCode}');
    }
  }
}
