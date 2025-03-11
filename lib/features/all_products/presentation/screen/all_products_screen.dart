import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../data/models/all_products_model.dart';
import '../widgets/product_item.dart';

class AllProductsScreen extends StatelessWidget {
  final List<Product> products;
  const AllProductsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInLeft(child: const Icon(Icons.arrow_back)),
        title: FadeInDown(child: const Text("All Products")),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.7),
          itemBuilder: (ctx, index) {
            return FadeInRight(
                delay: Duration(milliseconds: index * 200),
                child:  ProductItem(
                  product: products[index] ,
                ));
          }),
    );
  }
}
