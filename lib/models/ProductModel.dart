import 'package:store_app/models/RatingModel.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String image;
  final String category;
  final RatingModel ratingModel;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.ratingModel,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      ratingModel: RatingModel.fromJson(jsonData['rating']),
    );
  }
}
