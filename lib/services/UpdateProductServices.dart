import 'package:store_app/helper/api.dart';
import 'package:store_app/models/ProductModel.dart';
import 'package:store_app/shared/Constants.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required String category,
    required dynamic id
  }) async {
    Map<String, dynamic> data =
        await Api().put(url: "${KbaseUrl}products$id", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
    return ProductModel.fromJson(data);
  }
}
