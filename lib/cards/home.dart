import 'package:flutter/material.dart';

class Home {
  BuildContext context;
  Home({Key? key, required this.context});

  Widget generate() {
    return Text(
      'Home',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
