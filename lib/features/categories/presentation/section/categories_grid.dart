import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/categories/data/models/product_category.dart';

import '../widgets/category_widget.dart';


class CategoriesGrid extends StatelessWidget {
  final List<ProductCategory> categories; 
  const CategoriesGrid({
    super.key,
   required this.categories 
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (ctx, index) {
          return FadeInRight(
              delay: Duration(milliseconds: index * 200),
              child: ChangeNotifierProvider.value(
                  value: categories[index],
                  child: const CategoryWidget()));
        });
  }
}
