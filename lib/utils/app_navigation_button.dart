import 'package:beercoin/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppNavigationButton {
  static BottomNavigationBarItem make(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: AppColor.black40),
      activeIcon: Icon(icon, color: AppColor.headline),
      label: title,
      backgroundColor: AppColor.gray,
    );
  }
}
