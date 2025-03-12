import '../../../product_details/data/models/product.dart';

class AllProductsModel {
  List<Product> products;

  AllProductsModel({required this.products});

  factory AllProductsModel.fromJson(List<dynamic> json) {
    return AllProductsModel(
      products: json.map((e) => Product.fromJson(e)).toList(),
    );
  }
}
