import 'dart:ffi';
import 'dart:math';

import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_decoration.dart';
import 'package:flutter/material.dart';

class Home {
  BuildContext context;
  Home({Key? key, required this.context});
  double screenWidthFactor(double factor) {
    double width = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return width * factor;
  }

  double screenHeightFactor(double factor) {
    double height = max(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return height * factor;
  }

  Widget nearbyOffer(String name, double price, String from, double distance) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: screenWidthFactor(0.65),
      height: screenHeightFactor(0.2),
      decoration: AppDecoration.nearbyOffer,
      margin: EdgeInsets.all(screenWidthFactor(0.04)),
      child: Column(
        children: [
          Container(
            height: screenHeightFactor(0.2) * 0.75,
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
            height: screenHeightFactor(0.2) * 0.25,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("SZCZEGÓŁY OFERTY"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.primary),
                foregroundColor: MaterialStateProperty.all(AppColor.black),
                elevation: MaterialStateProperty.all(0),
                side: AppBorder.none,
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
      decoration: AppDecoration.offer,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthFactor(0.05),
              vertical: screenWidthFactor(0.02),
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
            children: const [
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
          child: const Text(
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
          child: const Text(
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
