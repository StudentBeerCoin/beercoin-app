import 'dart:math';

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  static Location random() {
    final Random random = Random();

    // Only generate a Cracow location
    return Location(
      latitude: random.nextDouble() * 0.05 + 50,
      longitude: random.nextDouble() * 0.07 + 19,
    );
  }
}