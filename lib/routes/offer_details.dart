import 'dart:math';
import 'package:beercoin/entity/user.dart';
import 'package:beercoin/routes/arguments/offer_details_arguments.dart';
import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:beercoin/entity/offer.dart';
import 'package:beercoin/utils/app_widget.dart';

class OfferDetails extends StatefulWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  OfferDetailsState createState() => OfferDetailsState();
}

class OfferDetailsState extends State {
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

  int _counter = 1;

  void _incrementCounter(int limit) {
    if (_counter < limit) {
      setState(() {
        _counter++;
      });
    }
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final OfferDetailsArguments args = ModalRoute.of(context)!.settings.arguments as OfferDetailsArguments;
    final Offer offer = args.offer;
    final Future<User> currentUser = args.user;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(screenWidthFactor(0.05)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${offer.beer.brand} ${offer.beer.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      AppWidget.closeButton(context),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.02)),
                  Row(
                    children: [
                      Text(
                        offer.type == "sell" ? "Sprzedający: " : "Kupujący: ",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${offer.owner.username} (${offer.owner.name} ${offer.owner.surname})",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.02)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidthFactor(0.25),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidthFactor(0.05),
                          vertical: screenWidthFactor(0.02),
                        ),
                        child: offer.beer.image(height: screenHeightFactor(0.15)),
                      ),
                      Container(
                        width: screenWidthFactor(0.65),
                        padding: EdgeInsets.all(screenWidthFactor(0.05)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Cena za szt.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                AppTokens.fromDouble(offer.price),
                              ],
                            ),
                            SizedBox(height: screenHeightFactor(0.01)),
                            AppWidget.map('Typ', "${offer.beer.packing} ${offer.beer.volume}ml"),
                            SizedBox(height: screenHeightFactor(0.01)),
                            AppWidget.map('Alkohol', "${offer.beer.alcohol}%"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.02)),
                  Row(
                    children: const [
                      Text(
                        "Podaj ilość",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(""),
                      const Text(""),
                      TextButton(
                        child: const Icon(Icons.remove),
                        onPressed: _decrementCounter,
                      ),
                      Text('$_counter'),
                      TextButton(
                        child: const Icon(Icons.add),
                        onPressed: () => _incrementCounter(offer.amount),
                      ),
                      const Text(""),
                      const Text(""),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Razem do zapłaty",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      AppTokens.fromDouble(offer.price * _counter),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'Twoje tokeny:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      FutureBuilder<User>(
                        future: currentUser,
                        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                          return AppTokens.fromDouble(snapshot.data == null ? 0 : snapshot.data!.balance);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeightFactor(0.01)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'Tokeny po transakcji:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      FutureBuilder<User>(
                        future: currentUser,
                        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                          return AppTokens.fromDouble(
                              snapshot.data == null ? 0 : (snapshot.data!.balance - (offer.price * _counter)));
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeightFactor(0.05)),
                    width: double.infinity,
                    height: 75,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Wykonanie transakcji...'),
                        ));
                      },
                      child: Text(offer.type == 'sell' ? 'Kupuję' : 'Sprzedaję'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColor.primary),
                        foregroundColor: MaterialStateProperty.all(AppColor.black),
                        side: AppBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
