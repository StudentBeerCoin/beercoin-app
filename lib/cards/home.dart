import 'dart:ffi';

import 'package:flutter/material.dart';

class Home {
  BuildContext context;
  Home({Key? key, required this.context});
  double screenWidthFactor(double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  double screenHeightFactor(double factor) {
    return MediaQuery.of(context).size.height * factor;
  }

  Widget nearbyOffer(String name, double price, String from, double distance) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: screenWidthFactor(0.65),
      height: screenHeightFactor(0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(screenWidthFactor(0.04)),
      child: Column(
        children: [
          Container(
            height: (3 * screenHeightFactor(0.2)) / 4,
            padding: EdgeInsets.all(screenWidthFactor(0.02)),
            child: Row(
              children: [
                Image.network(
                  "http://ocen-piwo.pl/upload/perla_export.webp",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeightFactor(0.2) / 4,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("SZCZEGÓŁY OFERTY"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFFFC83C)),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                elevation: MaterialStateProperty.all(0),
                side: MaterialStateProperty.all(
                  BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget offer() {
    return Container(
      height: screenHeightFactor(0.15),
      width: screenWidthFactor(0.9),
      margin: EdgeInsets.only(bottom: screenWidthFactor(0.05)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(
              screenWidthFactor(0.05),
              screenWidthFactor(0.02),
              screenWidthFactor(0.05),
              screenWidthFactor(0.02),
            ),
            child: Row(
              children: [
                Image.network(
                  "http://ocen-piwo.pl/upload/perla_export.webp",
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text("data"),
            ],
          )
        ],
      ),
    );
  }

  Widget generate() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: screenWidthFactor(0.05),
          ),
          child: Text(
            "Piwa w Twojej okolicy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.all(screenWidthFactor(0.02)),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              nearbyOffer("Perła", 21, "Janek", 1),
              nearbyOffer("Perła", 37, "Paweł", 2),
              nearbyOffer("Perła", 21, "Karol", 3.7),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: screenWidthFactor(0.05),
          ),
          child: Text(
            "Twoje oferty",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: [
            offer(),
            offer(),
            offer(),
            offer(),
            offer(),
          ],
        ),
      ],
    );
  }
}
