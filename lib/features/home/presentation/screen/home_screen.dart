import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/core/services/api_handler.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/styles.dart';
import '../../../../widget/appbar_icons.dart';
import '../section/home_app_bar.dart';
import '../section/home_sale_section.dart';
import '../widgets/home_text_field.dart';
import '../widgets/products_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        ApiHandler().getAllProducts();
      },
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const HomeTextField(),
              verticalSpacing(
                20,
              ),
              const HomeSaleSection(),
              FutureBuilder(
                future: ApiHandler().getAllProducts(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("An error occurred"),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  FadeInLeft(
                                    child: Text(
                                      "Latest Products",
                                      style: TextStyles.font16w600(context),
                                    ),
                                  ),
                                  const Spacer(),
                                  FadeInRight(
                                    child: AppBarIcons(
                                        function: () {
                                          context.pushNamed(
                                              Routes.allProductsScreen,
                                              arguments: snapshot.data!);
                                        },
                                        icon: IconlyBold.arrowRight2),
                                  ),
                                ],
                              ),
                            ),
                            ProductsGrid(
                              products: snapshot.data!,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: Text("An  occurred"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
