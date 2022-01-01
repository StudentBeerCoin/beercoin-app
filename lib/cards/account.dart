import 'package:flutter/material.dart';

class Account {
  BuildContext context;
  Account({Key? key, required this.context});

  double fontSize = 20;
  double padding(double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  Widget row(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: padding(0.05),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: padding(0.05)),
            child: Text(
              title + ":",
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String value, Function()? onPressed) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: padding(0.05),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(value),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            side: MaterialStateProperty.all(
              BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget generate() {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                padding(0.25), padding(0.1), padding(0.25), padding(0.1)),
            child: Image.network("https://sokoloowski.pl/avatar.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: padding(0.1), right: padding(0.1)),
          child: Column(
            children: [
              row("Imię", "Jan"),
              row("Nazwisko", "Kowalski"),
              row("E-mail", "jan.kow@beercoin.xyz"),
              row("Tokeny", "2137 🍺"),
            ],
          ),
        ),
        button("Edytuj profil", () {}),
        button("Twoje oferty", () {}),
      ],
    );
  }
}
