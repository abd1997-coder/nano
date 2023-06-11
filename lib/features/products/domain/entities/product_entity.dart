import 'package:nano_health/features/products/data/models/rating_model.dart';

class ProductEntity {
  int id;
  String title;
  var price;
  String description;
  String category;
  String image;
  RatingModel? rating;

  ProductEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});
}

