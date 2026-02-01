import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/gen/assets.gen.dart';

class HomeCardSmall extends StatelessWidget {
  const HomeCardSmall({
    super.key,
    required this.label,
    required this.iconTopLeft,
    required this.iconBottomRight,
    required this.bgColorList,
  });

  final String label;
  final String iconTopLeft;
  final String iconBottomRight;
  final List<Color> bgColorList;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
      child: Stack(
        children: [
          // main box
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: bgColorList,
                begin: AlignmentGeometry.bottomLeft,
                end: AlignmentGeometry.topRight,
              ),
              borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
            ),
            child: Center(
              child: Text(
                label,
                style: textTheme.labelLarge!.copyWith(
                  color: AppSolidColors.darkPrimaryText,
                ),
              ),
            ),
          ),

          // Overlays
          Positioned(
            bottom: -30,
            left: -30,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                Assets.svg.dotBox,
                width: AppDimens.iconSizeLarge * 2,
                height: AppDimens.iconSizeLarge * 2,
              ),
            ),
          ),
        
          Positioned(
            top: -40,
            right: -40,
            child: Opacity(
              opacity: 0.2,
              child: SvgPicture.asset(
                Assets.svg.dotBox,
                width: AppDimens.iconSizeLarge * 2,
                height: AppDimens.iconSizeLarge * 2,
              ),
            ),
          ),


          // icon top left
          Positioned(
            top: 10,
            left: 20,
            child: Opacity(
              opacity: 0.4,
              child: SvgPicture.asset(
                iconTopLeft,
                width: AppDimens.iconSizeMedium,
                height: AppDimens.iconSizeMedium,
              ),
            ),
          ),


          // icon bottom right
          Positioned(
            bottom: 10,
            right: 20,
            child: Opacity(
              opacity: 0.7,
              child: SvgPicture.asset(
                iconBottomRight,
                width: AppDimens.iconSizeMedium,
                height: AppDimens.iconSizeMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
