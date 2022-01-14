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
      longitude: position.latitude,
    );
  }

  double distanceTo(Location location) {
    final dx = longitude - location.longitude;
    final dy = latitude - location.latitude;

    return sqrt(dx * dx + dy * dy);
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
