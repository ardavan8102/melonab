import 'package:flutter/material.dart';

class AppSolidColors {

  static const Color primary = Color(0xff3674B5);
  static const Color secondary = Color (0xff578FCA);
  static const Color accent = Color(0xffA1E3F9);

  static const Color darkPrimaryBlue = Color.fromARGB(255, 16, 46, 78);

  static const Color primaryText = Color(0xffffffff);
  static const Color darkScaffoldBackground = Color(0xff383B49);
  static const Color lessDarkBackground = Color(0xff292e4b);

  static const Color primaryIcon = Color(0xffffffff);
  static const Color dividerColor = Color(0xffffffff);
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