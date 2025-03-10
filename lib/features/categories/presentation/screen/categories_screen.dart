import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../widget/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInLeft(child: const Icon(Icons.arrow_back)),
        title: FadeInDown(child: const Text("Categories")),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (ctx, index) {
            return FadeInRight(
                delay: Duration(milliseconds: index * 200),
                child: const CategoryWidget());
          }),
    );
  }
}
