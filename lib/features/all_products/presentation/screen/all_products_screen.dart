import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../widget/feeds_widget.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInLeft(child: const Icon(Icons.arrow_back)),
        title: FadeInDown(child: const Text("All Products")),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.7),
          itemBuilder: (ctx, index) {
            return FadeInRight(
                delay: Duration(milliseconds: index * 200),
                child: const FeedsWidget());
          }),
    );
  }
}
