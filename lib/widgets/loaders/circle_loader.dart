import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:melonab/core/consts/colors.dart';

class LoadingCircles extends StatelessWidget {
  const LoadingCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: AppSolidColors.accent,
    );
  }
}