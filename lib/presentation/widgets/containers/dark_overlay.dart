import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';

class DarkOverlayGradient extends StatelessWidget {
  const DarkOverlayGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: AppGradientColor.darkOverlayGradient,
        ),
      ),
    );
  }
}