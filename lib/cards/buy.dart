import 'package:flutter/material.dart';

class Buy {
  BuildContext context;
  Buy({Key? key, required this.context});

  Widget generate() {
    return Text(
      'Buy',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
