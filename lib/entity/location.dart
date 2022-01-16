import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Location({
    this.latitude = 50.06885478775746,
    this.longitude = 19.906279570458285,
  });

  Future<Location> current() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return Location(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  double distanceTo(Location location) {
    const double R = 6371;

    final double dLat = (location.latitude - latitude) * pi / 180;
    final double dLon = (location.longitude - longitude) * pi / 180;
    final double lat1 = latitude * pi / 180;
    final double lat2 = location.latitude * pi / 180;

    final double a = sin(dLat / 2) * sin(dLat / 2) + sin(dLon / 2) * sin(dLon / 2) * cos(lat1) * cos(lat2);
    final double c = 2 * asin(sqrt(a));

    return R * c;
  }

  static Location fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['x'] as double,
      longitude: json['y'] as double,
    );
  }

  static Location random() {
    final Random random = Random();

    // Only generate a Cracow location
    return Location(
      latitude: random.nextDouble() * 0.05 + 50,
      longitude: random.nextDouble() * 0.07 + 19,
    );
  }
}
