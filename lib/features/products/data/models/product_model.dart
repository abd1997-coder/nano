import 'package:nano_health/features/products/data/models/rating_model.dart';
import 'package:nano_health/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.category,
      required super.image,
      required super.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: RatingModel.fromJson(json['rating']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}
