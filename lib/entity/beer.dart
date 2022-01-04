import 'package:flutter/cupertino.dart';

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
      'http://ocen-piwo.pl/upload/$id.webp',
      fit: BoxFit.cover,
      height: height,
    );
  }
}
