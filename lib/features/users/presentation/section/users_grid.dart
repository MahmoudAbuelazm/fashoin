import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/features/users/data/model/user.dart';
import 'package:store_app/features/users/presentation/widgets/users_widget.dart';

class UsersGrid extends StatelessWidget {
  final List<User> users;
  const UsersGrid({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            children: users
                .map((e) => ChangeNotifierProvider.value(
                    value: e,
                    child: FadeInRight(
                        delay: Duration(milliseconds: users.indexOf(e) * 200),
                        child: const UsersWidget())))
                .toList()));
  }
}
