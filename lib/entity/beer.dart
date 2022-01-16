import 'dart:math';

import 'package:beercoin/utils/string_capitalize.dart';
import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';

class Beer {
  String id;
  String brand;
  String name;
  int volume;
  double alcohol;
  String packing;

  Beer({
    required this.brand,
    required this.name,
    this.id = 'perla_export',
    this.volume = 500,
    this.alcohol = 4.5,
    this.packing = 'Butelka',
  });

  Image image({double height = 100}) {
    return Image.network(
      'https://beercoin.xyz/api/assets/beer/$id',
      fit: BoxFit.cover,
      height: height,
    );
  }

  static Beer fromJson(Map<String, dynamic> json) {
    return Beer(
      id: json['id'] as String,
      brand: json['brand'] as String,
      name: json['name'] as String,
      volume: json['volume'] as int,
      alcohol: json['alcohol'] as double,
      packing: json['packing'] as String,
    );
  }

  static Beer random() {
    final faker = Faker();
    final random = Random();

    return Beer(
      brand: faker.lorem.word().capitalize(),
      name: faker.lorem.word().capitalize(),
      id: faker.guid.guid(),
      volume: [355, 500].elementAt(random.nextInt(2)),
      alcohol: faker.randomGenerator.element([4.5, 5.7, 6.0]),
      packing: faker.randomGenerator.element(['Butelka', 'Puszka']),
    );
  }
}
