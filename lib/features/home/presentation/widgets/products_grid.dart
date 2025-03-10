import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../widget/feeds_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 0.7),
        itemBuilder: (ctx, index) {
          return FadeInRight(
              delay: Duration(milliseconds: index * 1000),
              child: const FeedsWidget());
        });
  }
}
