import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:store_app/features/all_products/data/models/all_products_model.dart';

import '../../../all_products/presentation/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  const ProductsGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
              delay: Duration(milliseconds: index * 100),
              child:  ProductItem(
                product: products[index],
              ));
        });
  }
}
