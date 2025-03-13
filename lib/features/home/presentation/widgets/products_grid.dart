import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/product_details/presentation/screen/product_details_screen.dart';
import '../../../all_products/presentation/widgets/product_item.dart';
import '../../../product_details/data/models/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  const ProductsGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
        shrinkWrap: true,
        gridDelegate: SliverStairedGridDelegate(
          crossAxisSpacing: 18,
          mainAxisSpacing: 20,
          startCrossAxisDirectionReversed: true,
          pattern: [
            const StairedGridTile(0.5, 2 / 3),
            const StairedGridTile(0.5, 2 / 3),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => FadeInRight(
              delay: Duration(milliseconds: index * 100),
              child: OpenContainer(
                  closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (context, _) {
                    return ChangeNotifierProvider.value(
                        value: products[index], child: const ProductItem());
                  },
                  openBuilder: (context, _) {
                    return ChangeNotifierProvider.value(
                        value: products[index], child: const ProductDetails());
                  })),
          childCount: products.length,
        ));
    // GridView.builder(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemCount: products.length,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 0,
    //         mainAxisSpacing: 0,
    //         childAspectRatio: 0.7),
    //     itemBuilder: (ctx, index) {
    //       return FadeInRight(
    //           delay: Duration(milliseconds: index * 100),
    //           child: ChangeNotifierProvider.value(
    //             value: products[index],
    //             child: const ProductItem(
    //                 // product: products[index],
    //                 ),
    //           ));
    //     });
  }
}


// GridView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: products.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 0,
//             mainAxisSpacing: 0,
//             childAspectRatio: 0.7),
//         itemBuilder: (ctx, index) {
//           return FadeInRight(
//               delay: Duration(milliseconds: index * 100),
//               child: ChangeNotifierProvider.value(
//                 value: products[index],
//                 child: const ProductItem(
//                     // product: products[index],
//                     ),
//               ));
//         });