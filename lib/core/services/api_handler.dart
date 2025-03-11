import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/core/services/api_consts.dart' show baseApiUrl;
import 'package:store_app/features/all_products/data/models/all_products_model.dart';

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
}
