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
import 'package:permission_handler/permission_handler.dart';

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

  Future<void> _requestPermission() async {
    final ServiceStatus serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    if (serviceStatus != ServiceStatus.enabled) {
      print('Turn on location services before requesting permission.');
      return;
    }

    if (await Permission.locationWhenInUse.status == PermissionStatus.denied) {
      final PermissionStatus locationWhenInUseStatus = await Permission.locationWhenInUse.request();
      if (locationWhenInUseStatus == PermissionStatus.granted) {
        print('Permission granted');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Przyznano dostęp do lokalizacji'),
              content: const Text('Uruchom ponownie aplikację, by uzyskać dostęp do wszystkich funkcji.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  },
                ),
              ],
            );
          },
        );
      } else if (locationWhenInUseStatus == PermissionStatus.denied) {
        print('Permission denied. Show a dialog and again ask for the permission');
      } else if (locationWhenInUseStatus == PermissionStatus.permanentlyDenied) {
        print('Take the user to the settings page.');
        await openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _requestPermission();

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
