import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:flutter/material.dart';

class Account {
  BuildContext context;
  Account({Key? key, required this.context});

  double fontSize = 20;
  double screenWidthFactor(double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  Widget row(String title, String value, {bool tokens = false}) {
    Widget text;
    if (tokens) {
      text = RichText(
        text: TextSpan(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: AppColor.black,
          ),
          children: [
            TextSpan(text: value),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Tab(
                    icon:
                        Image.asset('assets/token.png', width: 20, height: 20)),
              ),
            ),
          ],
        ),
      );
    } else {
      text = Text(
        value,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: screenWidthFactor(0.05),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: screenWidthFactor(0.05)),
            child: Text(
              title + ":",
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
          text,
        ],
      ),
    );
  }

  Widget button(String value, Function()? onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidthFactor(0.05),
        vertical: screenWidthFactor(0.025),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(value),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.background),
            foregroundColor: MaterialStateProperty.all(AppColor.black),
            side: AppBorder.black,
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
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthFactor(0.25),
              vertical: screenWidthFactor(0.1),
            ),
            child: Image.network("https://sokoloowski.pl/avatar.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidthFactor(0.1),
          ),
          child: Column(
            children: [
              row("Imię", "Jan"),
              row("Nazwisko", "Kowalski"),
              row("E-mail", "jan.kow@beercoin.xyz"),
              row("Tokeny", "2137", tokens: true),
            ],
          ),
        ),
        button("Edytuj profil", () {}),
        button("Twoje oferty", () {}),
      ],
    );
  }
}
