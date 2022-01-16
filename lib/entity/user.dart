import 'dart:math';

import 'package:beercoin/entity/location.dart';
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
  Location location;

  User({
    this.id,
    this.username,
    required this.name,
    required this.surname,
    required this.email,
    this.phoneNumber,
    this.balance = 0,
    required this.location,
  });

  Image image({required double size}) {
    return Image.network(
      'https://sokoloowski.pl/avatar.png',
      fit: BoxFit.cover,
      width: size,
      height: size,
    );
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      balance: json['balance'] as double,
      location: Location.fromJson(json['location']),
    );
  }

  static User random() {
    final faker = Faker();
    final random = Random();

    return User(
      name: faker.person.firstName(),
      surname: faker.person.lastName(),
      email: faker.internet.email(),
      phoneNumber: faker.randomGenerator.fromPattern(['### ### ###']),
      balance: random.nextDouble() * 100,
      location: Location.random(),
    );
  }
}
