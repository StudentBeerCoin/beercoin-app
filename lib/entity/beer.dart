import 'package:flutter/cupertino.dart';

class Beer {
  String? id;
  String brand;
  String name;
  double volume;
  double alcohol;
  String packing;

  Beer({
    required this.brand,
    required this.name,
    this.id,
    this.volume = 500,
    this.alcohol = 4.5,
    this.packing = "bottle",
  });

  Image image({double height = 100}) {
    return Image.network(
      "http://ocen-piwo.pl/upload/perla_export.webp",
      fit: BoxFit.cover,
      height: height,
    );
  }
}
