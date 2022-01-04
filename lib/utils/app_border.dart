import 'package:beercoin/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppBorder {
  static MaterialStateProperty<BorderSide> none = MaterialStateProperty.all(
    const BorderSide(
      style: BorderStyle.none,
    ),
  );

  static MaterialStateProperty<BorderSide> black = MaterialStateProperty.all(
    BorderSide(
      width: 1,
      color: AppColor.black,
    ),
  );
}