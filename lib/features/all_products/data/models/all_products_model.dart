class AllProductsModel {
  List<Product> products;

  AllProductsModel({required this.products});

  factory AllProductsModel.fromJson(List<dynamic> json) {
    return AllProductsModel(
      products: json.map((e) => Product.fromJson(e)).toList(),
    );
  }
}

class Product {
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

class ProductCategory {
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
