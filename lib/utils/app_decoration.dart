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

  static BoxDecoration nearbyOfferDistance = BoxDecoration(
    color: AppColor.secondary,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration offer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      AppShadow.shadow,
    ],
  );
}
