import 'package:flutter/material.dart';

class Settings {
  BuildContext context;
  Settings({Key? key, required this.context});

  Widget generate() {
    return const Text(
      'Settings',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
