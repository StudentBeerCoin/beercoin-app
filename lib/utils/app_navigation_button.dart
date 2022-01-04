import 'package:beercoin/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppNavigationButton {
  static BottomNavigationBarItem home = BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: AppColor.black40,
    ),
    activeIcon: Icon(
      Icons.home,
      color: AppColor.headline,
    ),
    label: 'Główna',
    backgroundColor: AppColor.gray,
  );

  static BottomNavigationBarItem account = BottomNavigationBarItem(
    icon: Icon(
      Icons.account_circle,
      color: AppColor.black40,
    ),
    activeIcon: Icon(
      Icons.account_circle,
      color: AppColor.headline,
    ),
    label: 'Konto',
    backgroundColor: AppColor.gray,
  );

  static BottomNavigationBarItem buy = BottomNavigationBarItem(
    icon: Icon(
      Icons.shopping_cart,
      color: AppColor.black40,
    ),
    activeIcon: Icon(
      Icons.shopping_cart,
      color: AppColor.headline,
    ),
    label: 'Kup',
    backgroundColor: AppColor.gray,
  );

  static BottomNavigationBarItem sell = BottomNavigationBarItem(
    icon: Icon(
      Icons.store,
      color: AppColor.black40,
    ),
    activeIcon: Icon(
      Icons.store,
      color: AppColor.headline,
    ),
    label: 'Sprzedaj',
    backgroundColor: AppColor.gray,
  );
  
  static BottomNavigationBarItem settings = BottomNavigationBarItem(
    icon: Icon(
      Icons.settings,
      color: AppColor.black40,
    ),
    activeIcon: Icon(
      Icons.settings,
      color: AppColor.headline,
    ),
    label: 'Ustawienia',
    backgroundColor: AppColor.gray,
  );
}
