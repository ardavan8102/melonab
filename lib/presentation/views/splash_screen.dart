import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/strings.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0;

  @override
  void initState() {

    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1;
      });
    });

    // navigate to home screen
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (_) => HomePageScreen()),
      );
    });

  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: _opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // space from top
              Spacer(),

              Text(
                AppStrings.brandNameFa,
                style: textTheme.headlineLarge,
              ),
          
              AppDimens.smallSpacing.height,
          
              Text(
                AppStrings.brandSubText,
                style: textTheme.labelLarge,
              ),

              // space between text and loader
              Spacer(),

              SpinKitThreeBounce(
                color: AppSolidColors.secondary,
              ),

              AppDimens.largeSpacing.height,
            ],
          ),
        ),
      ),
    );
  }
}