import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';

class AppThemes {

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'YekanBakh',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppSolidColors.lightScaffoldBackground,

    textTheme: TextTheme(

      // headlines
      headlineLarge: TextStyle(
        fontSize: 50,
        fontWeight: .w900,
        color: AppSolidColors.primary,
      ),

      // labels
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: .w600,
        color: AppSolidColors.lightPrimaryText.withValues(alpha: .6)
      ),

    )
  );

}