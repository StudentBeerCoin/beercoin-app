import 'dart:math';

import 'package:beercoin/entity/beer.dart';
import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_decoration.dart';
import 'package:beercoin/utils/app_tokens.dart';
import 'package:flutter/material.dart';

class Home {
  BuildContext context;
  Home({Key? key, required this.context});
  double screenWidthFactor(double factor) {
    double width = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return width * factor;
  }

  double screenHeightFactor(double factor) {
    double height = max(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return height * factor;
  }

  Widget nearbyOffer(Beer beer, double price, String from, double distance) {
    double cardWidth = screenWidthFactor(0.65);
    double cardHeight = screenHeightFactor(0.2);

    return Container(
      clipBehavior: Clip.hardEdge,
      width: cardWidth,
      height: cardHeight,
      decoration: AppDecoration.nearbyOffer,
      margin: EdgeInsets.all(screenWidthFactor(0.04)),
      child: Column(
        children: [
          Container(
            height: cardHeight * 0.75,
            padding: EdgeInsets.all(screenWidthFactor(0.02)),
            child: Row(
              children: [
                SizedBox(
                  width: (cardWidth * 0.2) - screenWidthFactor(0.02),
                  child: beer.image(),
                ),
                Container(
                  width: (cardWidth * 0.8) - screenWidthFactor(0.02),
                  padding: EdgeInsets.symmetric(
                    horizontal: cardHeight * 0.05,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: cardHeight * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${beer.brand} ${beer.name}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: AppTokens.fromDouble(price),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: cardHeight * 0.05),
                        width: double.infinity,
                        child: Text(
                          'Od: ' + from,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: AppDecoration.nearbyOfferDistance,
                        padding: EdgeInsets.symmetric(
                          vertical: cardHeight * 0.05,
                        ),
                        child: Center(
                          child: Text(
                            distance.toString() + ' km od Ciebie',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: cardHeight * 0.25,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('SZCZEGÓŁY OFERTY'),
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

  Widget offerRow(String key, String value) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            key + ':',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget offer(Beer beer, double price, int amount) {
    double cardWidth = screenWidthFactor(0.9);
    double cardHeight = screenHeightFactor(0.15);

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.only(bottom: screenWidthFactor(0.05)),
      padding: EdgeInsets.only(right: cardWidth * 0.02),
      decoration: AppDecoration.offer,
      child: Row(
        children: [
          Container(
            width: cardWidth * 0.2,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidthFactor(0.05),
              vertical: screenWidthFactor(0.02),
            ),
            child: beer.image(),
          ),
          Container(
            width: cardWidth * 0.78,
            padding: EdgeInsets.all(screenWidthFactor(0.025)),
            child: Column(
              children: [
                SizedBox(
                  height: cardHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${beer.brand} ${beer.name}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      AppTokens.fromDouble(price),
                    ],
                  ),
                ),
                SizedBox(
                  height: cardHeight * 0.2,
                  child: offerRow('Typ', '${beer.packing} ${beer.volume}ml'),
                ),
                SizedBox(
                  height: cardHeight * 0.2,
                  child: offerRow('Alkohol', '${beer.alcohol}%'),
                ),
                SizedBox(
                  height: cardHeight * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      offerRow('Ilość', amount.toString()),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              'Razem:',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          AppTokens.fromDouble(amount * price),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget generate() {
    // For now, just generate some random data
    Beer perla = Beer(
      id: 'perla_export',
      brand: 'Perła',
      name: 'Export',
    );

    Beer kustosz = Beer(
      id: '90f32c6f4fc1303c4f3cd702411a0449',
      brand: 'Kustosz',
      name: 'Tequila',
      packing: 'Puszka',
    );

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: screenWidthFactor(0.05),
          ),
          child: const Text(
            'Piwa w Twojej okolicy',
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
              nearbyOffer(kustosz, 21, 'Janek', 1),
              nearbyOffer(perla, 37, 'Paweł', 2),
              nearbyOffer(perla, 21, 'Karol', 3.7),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: screenWidthFactor(0.05),
          ),
          child: const Text(
            'Twoje oferty',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: [
            offer(perla, 21, 2),
            offer(kustosz, 37, 1),
            offer(kustosz, 21, 3),
            offer(perla, 37, 7),
          ],
        ),
      ],
    );
  }
}
