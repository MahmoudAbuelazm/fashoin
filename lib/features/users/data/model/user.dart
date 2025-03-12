import 'package:flutter/material.dart';

class AllUsersModel {
  List<User> users;

  AllUsersModel({required this.users});

  factory AllUsersModel.fromJson(List<dynamic> json) {
    return AllUsersModel(
      users: json.map((e) => User.fromJson(e)).toList(),
    );
  }
}


class User with ChangeNotifier {
  final int id;
  final String name, email, password,role , avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      avatar: json['avatar'],
    );
  }
}
