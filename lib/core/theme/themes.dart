import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';

class AppThemes {

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'YekanBakh',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppSolidColors.darkScaffoldBackground,

    textTheme: TextTheme(

      // headlines
      headlineLarge: TextStyle(
        fontSize: 50,
        fontWeight: .w900,
        color: AppSolidColors.primary,
      ),


      // titles
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: .w700
      ),

      // labels
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: .w600,
        color: AppSolidColors.darkPrimaryText.withValues(alpha: .6)
      ),

      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: .w400,
        color: AppSolidColors.darkPrimaryText
      ),

    )
  );

}