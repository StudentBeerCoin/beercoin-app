import 'dart:math';

import 'package:faker/faker.dart';
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

  static User random() {
    final faker = Faker();
    final random = Random();
    final randomGenerator = RandomGenerator();

    return User(
      name: faker.person.firstName(),
      surname: faker.person.lastName(),
      email: faker.internet.email(),
      phoneNumber: randomGenerator.fromPattern(['### ### ###']),
      balance: random.nextDouble() * 100,
    );
  }
}
