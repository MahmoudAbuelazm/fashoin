import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/features/users/data/model/user.dart';

import '../../../../core/theme/styles.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return ListTile(
      leading: FancyShimmerImage(
        boxDecoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        height: context.screenHeight * 0.15,
        width: context.screenWidth * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: user.avatar,
        boxFit: BoxFit.fill,
      ),
      title: Text(
        user.name,
      ),
      subtitle: Text(
        user.email,
      ),
      trailing: Text(
        user.role,
        style: TextStyles.fontFlirtw700(context),
      ),
    );
  }
}
