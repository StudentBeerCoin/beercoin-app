import 'dart:math';

import 'package:beercoin/cards/buy.dart';
import 'package:beercoin/entity/offer.dart';
import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_navigation_button.dart';
import 'package:beercoin/utils/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final offer = ModalRoute.of(context)!.settings.arguments as Offer;

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

    // TODO: finish UI
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.all(screenWidthFactor(0.05)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${offer.beer.brand} ${offer.beer.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      AppWidget.closeButton(context),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
