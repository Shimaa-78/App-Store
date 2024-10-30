import 'package:flutter/cupertino.dart';

class ProductModel {
  final String title;
  final dynamic id;
  final double price;
  final String description;
  final String category;
  final String image;
  RatingModel rating;

  ProductModel({
    required this.title,
    required this.category,
    required this.id,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      price: (json['price'] as num).toDouble(), // Convert to double
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(json) {
    return RatingModel(
      rate: (json['rate'] as num).toDouble(), // Convert to double
      count: json['count'],
    );
  }
}
