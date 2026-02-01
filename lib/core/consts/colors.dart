import 'package:flutter/material.dart';

class AppSolidColors {

  // Light Mode
  static const Color primary = Color(0xff3674B5);
  static const Color secondary = Color (0xff578FCA);
  static const Color accent = Color(0xffA1E3F9);
  static const Color lightScaffoldBackground = Color(0xfff5f5f5);
  static const Color lightPrimaryText = Color(0xff131313);


  // dark Mode
  static const Color darkScaffoldBackground = Color(0xff121212);
  static const Color darkPrimaryText = Color(0xfff5f5f5);


}


class AppGradientColor {

  static const List<Color> primaryFadeGradient = [
    AppSolidColors.primary,
    Colors.transparent,
  ];

  static const List<Color> secondaryFadeGradient = [
    AppSolidColors.secondary,
    Colors.transparent,
  ];


  static const List<Color> homeScreenCardSmall1 = [
    Color(0xffe330e3),
    Color(0xff982598)
  ];

  static const List<Color> homeScreenCardSmall2 = [
    Color(0xff6ebdff),
    Color(0xff008BFF)
  ];

  static const List<Color> homeScreenCardBig = [
    Color.fromARGB(255, 33, 146, 30),
    Color(0xff08CB00)
  ];

}