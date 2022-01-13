import 'package:flutter/widgets.dart';

class User {
  String? id;
  String? username;
  String name;
  String surname;
  String email;
  String? phoneNumber;
  double balance;

  User({
    required this.name,
    required this.surname,
    required this.email,
    this.id,
    this.username,
    this.phoneNumber,
    this.balance = 0,
  });

  Image image({required double size}) {
    return Image.network(
      'https://sokoloowski.pl/avatar.png',
      fit: BoxFit.cover,
      width: size,
      height: size,
    );
  }
}
