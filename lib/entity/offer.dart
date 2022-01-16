import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:beercoin/entity/beer.dart';
import 'package:beercoin/entity/location.dart';
import 'package:beercoin/entity/user.dart';
import 'package:faker/faker.dart';

class Offer {
  String id;
  User owner;
  Beer beer;
  int amount;
  double price;
  Location location;
  String type;

  Offer({
    required this.id,
    required this.owner,
    required this.beer,
    required this.amount,
    required this.price,
    required this.location,
    required this.type,
  });

  double total() {
    return amount * price;
  }

  Future<String> distance() async {
    return await Location().current().then((currentLocation) {
      return currentLocation.distanceTo(location).toStringAsFixed(1);
    });
  }

  static Future<List<Offer>> fetchOffers() async {
    final response = await http.get(Uri.parse('https://beercoin.xyz/api/offer/offers'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((e) => Offer.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Future<List<Offer>> fetchNearbyOffers(double radius) async {
    final currentLocation = await Location().current();
    print("${currentLocation.latitude}, ${currentLocation.longitude}");

    final response = await http.get(
      Uri.parse('https://beercoin.xyz/api/offer/find/${currentLocation.latitude}/${currentLocation.longitude}/$radius'),
    );

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((e) => Offer.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Offer fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'] as String,
      owner: User.fromJson(json['owner']),
      beer: Beer.fromJson(json['beer']),
      amount: json['amount'] as int,
      price: (json['price'] as num).toDouble(),
      location: Location.fromJson(json['location']),
      type: json['type'] as String,
    );
  }

  static Offer random() {
    final faker = Faker();
    final random = Random();

    return Offer(
      id: faker.guid.guid(),
      beer: Beer.random(),
      owner: User.random(),
      amount: random.nextInt(20) + 1,
      price: ((random.nextDouble() + double.minPositive) * (random.nextInt(20) + 1)),
      location: Location.random(),
      type: faker.randomGenerator.element(['buy', 'sell']),
    );
  }
}
