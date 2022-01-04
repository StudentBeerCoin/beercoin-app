import 'package:beercoin/utils/app_color.dart';
import 'package:beercoin/utils/app_shadow.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration nearbyOffer = BoxDecoration(
    color: AppColor.background,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      AppShadow.shadow,
    ],
  );

  static BoxDecoration offer = BoxDecoration(
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
  );
}
