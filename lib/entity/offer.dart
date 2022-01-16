import 'dart:math';
import 'dart:convert';
import 'package:beercoin/utils/app_config.dart';
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

  ///
  /// Returns list of all offers
  ///
  static Future<List<Offer>> fetchOffers() async {
    return http.get(Uri.parse('${AppConfig.host}/api/offer/offers')).then((res) {
      if (res.statusCode == 200) {
        return (jsonDecode(res.body) as List).map((e) => Offer.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load offers');
      }
    });
  }

  ///
  /// Returns list of buying offers
  ///
  static Future<List<Offer>> fetchBuyingOffers() async {
    return http.get(Uri.parse('${AppConfig.host}/api/offer/buy/offers')).then((res) {
      if (res.statusCode == 200) {
        return (jsonDecode(res.body) as List).map((e) => Offer.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load offers');
      }
    });
  }

  ///
  /// Returns list of selling offers
  ///
  static Future<List<Offer>> fetchSellingOffers() async {
    return http.get(Uri.parse('${AppConfig.host}/api/offer/sell/offers')).then((res) {
      if (res.statusCode == 200) {
        return (jsonDecode(res.body) as List).map((e) => Offer.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load offers');
      }
    });
  }

  ///
  /// Returns list of offers in given [radius] (km)
  ///
  static Future<List<Offer>> fetchNearbyOffers(double radius) async {
    final location = await Location().current();

    return http
        .get(Uri.parse('${AppConfig.host}/api/offer/find/${location.latitude}/${location.longitude}/$radius'))
        .then((res) {
      if (res.statusCode == 200) {
        return (jsonDecode(res.body) as List).map((e) => Offer.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load offers');
      }
    });
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
