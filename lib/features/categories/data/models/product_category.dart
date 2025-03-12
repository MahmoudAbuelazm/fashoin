
import 'package:flutter/material.dart';

class ProductCategory with ChangeNotifier {
  final int id;
  final String name, slug, image;

  ProductCategory(
      {required this.id,
      required this.name,
      required this.slug,
      required this.image});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}
