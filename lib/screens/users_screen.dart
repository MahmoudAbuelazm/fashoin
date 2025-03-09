import 'package:flutter/material.dart';

import '../widget/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return const UsersWidget();
            }));
  }
}