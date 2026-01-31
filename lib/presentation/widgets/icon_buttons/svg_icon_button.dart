import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melonab/core/consts/dimens.dart';

class IconSvgButton extends StatelessWidget {
  const IconSvgButton({
    super.key,
    required this.splashColor,
    required this.iconPath,
    required this.function,
    required this.gradientColors,
  });

  final Color splashColor;
  final String iconPath;
  final Function() function;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(AppDimens.largeCircularRadius),
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: .bottomCenter,
              end: .topCenter,
            ),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            iconPath,
            width: AppDimens.iconSizeMedium,
            height: AppDimens.iconSizeMedium,
          ),
        ),
      ),
    );
  }
}