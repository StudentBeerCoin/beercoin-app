import 'package:beercoin/entity/location.dart';
import 'package:beercoin/entity/user.dart';
import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_tokens.dart';
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
      text = AppTokens.fromString(value);
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
              title + ':',
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
    return FutureBuilder<User>(
      future: User.fetchUser('68900ae2-8849-482e-88d3-c74cc1c661aa'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data!;
          return Column(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidthFactor(0.1),
                  ),
                  child: user.image(
                    size: screenWidthFactor(0.6),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidthFactor(0.1),
                ),
                child: Column(
                  children: [
                    row('Imię', user.name),
                    row('Nazwisko', user.surname),
                    row('E-mail', user.email),
                    row('Tokeny', user.balance.toString(), tokens: true),
                  ],
                ),
              ),
              button('Edytuj profil', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tu znajdziesz ustawienia swojego konta'),
                  ),
                );
              }),
              button('Twoje oferty', () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tu znajdziesz swoje oferty oraz opcje zarządzania nimi'),
                  ),
                );
              }),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
