import 'package:flutter/material.dart';

class Palette {
  static const primary = Color(0xFFFE724C);
  static const secondary = Color(0xFF020D19);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Colors.transparent;

  static const ooprimary = Color(0xFF2E2E2E);

  static const red = Colors.red;

  static getOoWhite(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? ooprimary : white;
  static getOoprimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? ooprimary : primary;
}
