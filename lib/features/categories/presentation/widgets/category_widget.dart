import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/core/theme/styles.dart';
import 'package:store_app/features/categories/data/models/product_category.dart';


class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductCategory productCategory =
        Provider.of<ProductCategory>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FancyShimmerImage(
              height: context.screenHeight * 0.45,
              width: context.screenWidth * 0.45,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: productCategory.image,
              boxFit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              productCategory.name,
              textAlign: TextAlign.center,
              style: TextStyles.font24wBoldWithBackground(context),
            ),
          )
        ],
      ),
    );
  }
}
