
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/core/theme/colors.dart';

import '../../../../core/routing/routes.dart';
import '../../../../widget/appbar_icons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManagers.cultured,
      title: BounceInDown(child: const Text("Home")),
      leading: FadeInLeft(
        child: AppBarIcons(
          function: () {
            context.pushNamed(Routes.categoriesScreen);
          },
          icon: IconlyBold.category,
        ),
      ),
      actions: [
        FadeInRight(
          child: AppBarIcons(
            function: () {
              context.pushNamed(Routes.usersScreen);
            },
            icon: IconlyBold.user3,
            
          ),
        ),
      ],
    );
  }
}