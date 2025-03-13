import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class HomeTextField extends StatefulWidget {
  const HomeTextField({
    super.key,
  });

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
  bool isOut = false;

  late TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        isOut = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isOut ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: TextFormField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: "Search for what you need",
          filled: true,
          fillColor: ColorsManagers.brightGray,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).cardColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: ColorsManagers.darkSkyBlue,
            ),
          ),
        ),
      ),
    );
  }
}
