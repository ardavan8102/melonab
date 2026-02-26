import 'package:flutter/material.dart';

class AppSolidColors {

  static const Color primary = Color(0xff8247ff);
  static const Color secondary = Color (0xffe0d2ff);
  static const Color accent = Color(0xffba28f9);

  static const Color darkPrimary = Color.fromARGB(255, 28, 2, 85);

  static const Color primaryText = Color(0xffffffff);
  static const Color darkScaffoldBackground = Color.fromARGB(255, 34, 36, 44);
  static const Color drawerHeaderBackground = Color.fromARGB(255, 59, 62, 77);
  static const Color drawerBackground = Color.fromARGB(255, 52, 55, 68);
  static const Color lessDarkBackground = Color(0xff292e4b);

  static const Color primaryIcon = Color(0xffffffff);
  static const Color dividerColor = Color(0xffffffff);
}


class AppGradientColor {

  static List<Color> darkOverlayGradient = [
    Colors.black87,
    Colors.transparent,
  ];

  static const List<Color> secondaryFadeGradient = [
    AppSolidColors.secondary,
    Colors.transparent,
  ];

}