import 'package:flutter/cupertino.dart';

class AppTokens {
  static Widget fromDouble(double price, {double size = 20}) {
    return Row(
      children: [
        Text(
          price.toStringAsFixed(2),
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          'assets/token.png',
          width: size,
          height: size,
        ),
      ],
    );
  }

  static Widget fromString(String price, {double size = 20}) {
    return Row(
      children: [
        Text(
          price,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          'assets/token.png',
          width: size,
          height: size,
        ),
      ],
    );
  }
}
