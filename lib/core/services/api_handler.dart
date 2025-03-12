import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/core/services/api_consts.dart';
import 'package:store_app/features/users/data/model/user.dart';
import '../../features/categories/data/models/product_category.dart';
import '../../features/product_details/data/models/product.dart';

class ApiHandler {
  Future<List<Product>> getAllProducts() async {
    var uri = Uri.https(
      baseApiUrl,
      '/api/v1/products',
    );

    var response = await http.get(uri);

    var data = (json.decode(response.body) as List)
        .map((e) => Product.fromJson(e))
        .toList();

    return data;
  }

  Future<List<ProductCategory>> getAllCategories() async {
    var uri = Uri.https(
      baseApiUrl,
      '/api/v1/categories',
    );

    var response = await http.get(uri);

    var data = (json.decode(response.body) as List)
        .map((e) => ProductCategory.fromJson(e))
        .toList();

    return data;
  }

  Future<List<User>> getAllUsers() async {
    var uri = Uri.https(
      baseApiUrl,
      '/api/v1/users',
    );

    var response = await http.get(uri);

    var data = (json.decode(response.body) as List)
        .map((e) => User.fromJson(e))
        .toList();

    return data;
  }
}
