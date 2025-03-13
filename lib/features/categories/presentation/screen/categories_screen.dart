import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import '../../../../core/services/api_handler.dart';
import '../section/categories_grid.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FadeInLeft(
            child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        )),
        title: FadeInDown(child: const Text("Categories")),
      ),
      body: FutureBuilder(
        future: ApiHandler().getAllCategories(),
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
            return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CategoriesGrid(
                      categories: snapshot.data!,
                    ),
                  ],
                ));
          }
          return const Center(
            child: Text("An  occurred"),
          );
        },
      ),
    );
  }
}
