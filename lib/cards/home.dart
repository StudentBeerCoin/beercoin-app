import 'dart:math';

import 'package:beercoin/entity/beer.dart';
import 'package:beercoin/entity/location.dart';
import 'package:beercoin/entity/offer.dart';
import 'package:beercoin/entity/user.dart';
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
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    return width * factor;
  }

  double screenHeightFactor(double factor) {
    double height = max(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    return height * factor;
  }

  Location currentLocation = Location(latitude: 0, longitude: 0);

  Widget nearbyOffer(Offer offer) {
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
            padding: EdgeInsets.symmetric(horizontal: screenWidthFactor(0.02)),
            child: Row(
              children: [
                SizedBox(
                  width: (cardWidth * 0.2) - screenWidthFactor(0.02),
                  child: offer.beer.image(),
                ),
                Container(
                  width: (cardWidth * 0.8) - screenWidthFactor(0.02),
                  padding: EdgeInsets.symmetric(
                    horizontal: cardHeight * 0.05,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: cardHeight * 0.075,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: cardHeight * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${offer.beer.brand} ${offer.beer.name}',
                                style: const TextStyle(fontSize: 16),
                              ),
                              AppTokens.fromDouble(offer.price),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: cardHeight * 0.2,
                          width: double.infinity,
                          child: Text(
                            'Od: ' + offer.seller.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          height: cardHeight * 0.2,
                          width: double.infinity,
                          decoration: AppDecoration.nearbyOfferDistance,
                          child: Center(
                            child: Text(
                              offer.distance(currentLocation).toString() +
                                  ' km od Ciebie',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: cardHeight * 0.25,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/offer_details',
                  arguments: offer,
                );
              },
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

  Widget offer(Offer offer) {
    double cardWidth = screenWidthFactor(0.9);
    double cardHeight = screenHeightFactor(0.15);

    return Container(
      clipBehavior: Clip.hardEdge,
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.only(
        bottom: screenWidthFactor(0.05),
      ),
      decoration: AppDecoration.offer,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/offer_details',
            arguments: offer,
          );
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.only(
              right: cardWidth * 0.02,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(AppColor.background),
          foregroundColor: MaterialStateProperty.all(AppColor.black),
          elevation: MaterialStateProperty.all(0),
          side: AppBorder.none,
        ),
        child: Row(
          children: [
            Container(
              width: cardWidth * 0.2,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidthFactor(0.05),
                vertical: screenWidthFactor(0.02),
              ),
              child: offer.beer.image(),
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
                          '${offer.beer.brand} ${offer.beer.name}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        AppTokens.fromDouble(offer.price),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: cardHeight * 0.2,
                    child: offerRow(
                        'Typ', '${offer.beer.packing} ${offer.beer.volume}ml'),
                  ),
                  SizedBox(
                    height: cardHeight * 0.2,
                    child: offerRow('Alkohol', '${offer.beer.alcohol}%'),
                  ),
                  SizedBox(
                    height: cardHeight * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        offerRow('Ilość', offer.amount.toString()),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                'Razem:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            AppTokens.fromDouble(offer.total()),
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
      ),
    );
  }

  Widget generate() {
    // For now, just generate some random data
    Beer perla = Beer(
      id: 't_perla',
      brand: 'Perła',
      name: 'Export',
    );

    Beer kustosz = Beer(
      id: 't_kustosz',
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
            children: List<Widget>.generate(
              Random().nextInt(7) + 3,
              (int i) => nearbyOffer(Offer.random()),
            ),
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
          children: List<Widget>.generate(
            Random().nextInt(40) + 10,
            (int i) => offer(Offer.random()),
          ),
        ),
      ],
    );
  }
}
