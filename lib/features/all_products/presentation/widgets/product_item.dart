import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../product_details/data/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    return SizedBox(
      height: context.screenHeight * 0.3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FancyShimmerImage(
              height: context.screenHeight * 0.3,
              width: double.infinity,
              errorWidget: const Icon(
                IconlyBold.danger,
                color: Colors.red,
                size: 28,
              ),
              imageUrl: product.images[0],
              boxFit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: ColorsManagers.darkSkyBlue.withOpacity(.83),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyles.font13w700Inter(context),
                ),
                Text(product.category.name,
                    style: TextStyles.font12w700Inter(context)),
                Text('\$${product.price}',
                    style: TextStyles.font12w400Inter(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: Material(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Theme.of(context).cardColor,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(8.0),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ChangeNotifierProvider.value(
//                     value: product, child: const ProductDetails()),
//               ),
//             );
//           },
//           child: 
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Flexible(
//                       child: RichText(
//                         text: TextSpan(
//                             text: '\$',
//                             style: const TextStyle(
//                                 color: Color.fromRGBO(33, 150, 243, 1)),
//                             children: <TextSpan>[
//                               TextSpan(
//                                   text: product.price.toString(),
//                                   style: const TextStyle(
//                                       color: ColorsManagers.charcoal,
//                                       fontWeight: FontWeight.w600)),
//                             ]),
//                       ),
//                     ),
//                     const Icon(IconlyBold.heart),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: FancyShimmerImage(
//                     height: context.screenHeight * 0.2,
//                     width: double.infinity,
//                     errorWidget: const Icon(
//                       IconlyBold.danger,
//                       color: Colors.red,
//                       size: 28,
//                     ),
//                     imageUrl: product.images[0],
//                     boxFit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   product.title,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                   style: TextStyles.font17w700(context),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
