
import 'package:flutter/material.dart';

import '../../../categories/data/models/product_category.dart';

class Product with ChangeNotifier {
  final int id, price;
  final String title, slug, description;
  final List<String> images;
  final ProductCategory category;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.slug,
      required this.description,
      required this.images,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      images: List<String>.from(json['images']),
      category: ProductCategory.fromJson(json['category']),
    );
  }
}
