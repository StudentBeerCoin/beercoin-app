import 'dart:io';

import 'package:beercoin/cards/account.dart';
import 'package:beercoin/cards/buy.dart';
import 'package:beercoin/cards/home.dart';
import 'package:beercoin/routes/offer_details.dart';
import 'package:beercoin/cards/sell.dart';
import 'package:beercoin/cards/settings.dart';
import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_navigation_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Beercoin",
      initialRoute: '/',
      routes: {
        '/': (context) => const MyStatefulWidget(),
        '/offer_details': (context) => const OfferDetails(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(context: context).generate(),
      Account(context: context).generate(),
      Buy(context: context).generate(),
      Sell(context: context).generate(),
      Settings(context: context).generate(),
    ];

    List<BottomNavigationBarItem> defaultList = <BottomNavigationBarItem>[
      AppNavigationButton.make(Icons.home, 'Główna'),
      AppNavigationButton.make(Icons.account_circle, 'Konto'),
      AppNavigationButton.make(Icons.shopping_cart, 'Kup'),
      AppNavigationButton.make(Icons.storefront, 'Sprzedaj'),
      AppNavigationButton.make(Icons.settings, 'Ustawienia'),
    ];

    List<BottomNavigationBarItem> cupertinoList = <BottomNavigationBarItem>[
      AppNavigationButton.make(CupertinoIcons.house, 'Główna'),
      AppNavigationButton.make(CupertinoIcons.person_crop_circle, 'Konto'),
      AppNavigationButton.make(CupertinoIcons.cart, 'Kup'),
      AppNavigationButton.make(Icons.storefront, 'Sprzedaj'),
      AppNavigationButton.make(CupertinoIcons.settings, 'Ustawienia'),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Beercoin app'),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: SingleChildScrollView(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: Platform.isIOS ? cupertinoList : defaultList,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.headline,
        onTap: _onItemTapped,
      ),
    );
  }
}
