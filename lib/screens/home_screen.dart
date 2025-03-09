import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/consts/global_colors.dart';

import '../widget/appbar_icons.dart';
import '../widget/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: AppBarIcons(
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    icon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    ),
                  ),
                  hintText: "Search",
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  prefixIcon: const Icon(IconlyBold.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SaleWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
