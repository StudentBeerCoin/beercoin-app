import 'dart:math';

import 'package:beercoin/entity/beer.dart';
import 'package:beercoin/entity/location.dart';
import 'package:beercoin/entity/user.dart';
import 'package:faker/faker.dart';

class Offer {
  String id;
  Beer beer;
  User seller;
  int amount;
  double price;
  Location location;

  Offer({
    required this.id,
    required this.beer,
    required this.seller,
    required this.amount,
    required this.price,
    required this.location,
  });

  double total() {
    return amount * price;
  }

  double distance(Location currentLocation) {
    return -1;
  }

  static Offer random() {
    final faker = Faker();
    final random = Random();

    return Offer(
      id: faker.guid.guid(),
      beer: Beer.random(),
      seller: User.random(),
      amount: random.nextInt(20) + 1,
      price: ((random.nextDouble() + double.minPositive) * (random.nextInt(20) + 1)),
      location: Location.random(),
    );
  }
}
