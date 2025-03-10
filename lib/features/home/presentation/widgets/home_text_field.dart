import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../core/theme/colors.dart';


class HomeTextField extends StatefulWidget {
  const HomeTextField({
    super.key,
  })  ;

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {

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
    return TextFormField(
      controller: _searchController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            _searchController.clear();
          },
          icon: const Icon(
            IconlyLight.search,
            color: ColorsManagers.flirt,
          ),
        ),
        hintText: "Search",
        filled: true,
        fillColor: Theme.of(context).cardColor,
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
          ),
        ),
      ),
    );
  }
}
