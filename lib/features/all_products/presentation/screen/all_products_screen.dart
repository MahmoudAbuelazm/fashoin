import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import '../../../home/presentation/widgets/products_grid.dart';
import '../../../product_details/data/models/product.dart';

class AllProductsScreen extends StatelessWidget {
  final List<Product> products;
  const AllProductsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInLeft(
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        title: FadeInDown(child: const Text("All Products")),
      ),
      body: ProductsGrid(products: products),
    );
  }
}
