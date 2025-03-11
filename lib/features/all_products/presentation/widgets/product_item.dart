import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/features/all_products/data/models/all_products_model.dart';

import '../../../../core/theme/colors.dart';
import '../../../product_details/presentation/screen/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductDetails(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text:  TextSpan(
                            text: '\$',
                            style: const TextStyle(
                                color: Color.fromRGBO(33, 150, 243, 1)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: product.price.toString(),
                                  style: const TextStyle(
                                      color: ColorsManagers.charcoal,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                    const Icon(IconlyBold.heart),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    height: context.screenHeight * 0.2,
                    width: double.infinity,
                    errorWidget: const Icon(
                      IconlyBold.danger,
                      color: Colors.red,
                      size: 28,
                    ),
                    imageUrl: product.images[0],
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 17,
                    //  fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
