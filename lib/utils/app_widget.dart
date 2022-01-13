import 'package:flutter/material.dart';
import 'package:beercoin/utils/app_border.dart';
import 'package:beercoin/utils/app_color.dart';

class AppWidget {
  static Widget closeButton(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(AppColor.black),
          elevation: MaterialStateProperty.all(0),
          side: AppBorder.none,
        ),
      ),
    );
  }
}
