import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/core/helpers/extinsions.dart';

import '../core/theme/styles.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FancyShimmerImage(
        height: context.screenHeight * 0.15,
        width: context.screenWidth * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: "https://placeimg.com/640/480/any",
        boxFit: BoxFit.fill,
      ),
      title: const Text("User name"),
      subtitle: const Text("Email@email.com"),
      trailing:  Text(
        "User role",
        style: TextStyles.fontFlirtw700(context),
      ),
    );
  }
}
