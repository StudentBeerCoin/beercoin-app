import 'package:flutter/material.dart';

class Sell {
  BuildContext context;
  Sell({Key? key, required this.context});

  Widget generate() {
    return Text(
      'Sell',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
