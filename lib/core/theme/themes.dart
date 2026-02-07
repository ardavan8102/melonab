import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';

class AppThemes {

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'YekanBakh',

    scaffoldBackgroundColor: AppSolidColors.darkScaffoldBackground,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppSolidColors.primary,
      brightness: Brightness.dark,
    ),
    
    useMaterial3: false,

    textTheme: TextTheme(

      // headlines
      headlineLarge: TextStyle(
        fontSize: 50,
        fontWeight: .w900,
        color: AppSolidColors.accent,
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
      ),

      labelMedium: TextStyle(
        fontSize: 18,
        fontWeight: .w400,
      ),

      labelSmall: TextStyle(
        fontSize: 16,
        fontWeight: .w300,
      ),

    )
  );

}