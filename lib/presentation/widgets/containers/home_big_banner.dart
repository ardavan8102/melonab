import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/gen/assets.gen.dart';

class HomeBigBanner extends StatelessWidget {
  const HomeBigBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: AppDimens.largeRowHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppGradientColor.homeScreenCardBig,
          begin: AlignmentGeometry.bottomLeft,
          end: AlignmentGeometry.topRight,
        ),
        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
        child: Stack(
          children: [
            // text
            Positioned(
              right: AppDimens.paddingMedium,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                spacing: AppDimens.marginSmall,
                children: [
                  Text(
                    'نظر شما برای ما مهمه',
                    style: textTheme.labelMedium!.copyWith(
                      color: AppSolidColors.darkPrimaryText.withValues(alpha: .8),
                      fontSize: 12,
                    ),
                  ),
                  
                  Text(
                    'بازخورد خود را برای ما ارسال کنید',
                    style: textTheme.labelLarge!.copyWith(
                      color: AppSolidColors.darkPrimaryText,
                      fontSize: 14,
                    )
                  ),
                ],
              ),
            ),
        
            // overlays
            Positioned(
              bottom: -50,
              left: -50,
              child: Opacity(
                opacity: 0.3,
                child: SvgPicture.asset(
                  Assets.svg.dotBox,
                  width: AppDimens.iconSizeLarge * 3,
                  height: AppDimens.iconSizeLarge * 3,
                ),
              ),
            ),

            Positioned(
              top: 20,
              left: 40,
              child: Opacity(
                opacity: 0.5,
                child: Transform.rotate(
                  angle: .4,
                  child: SvgPicture.asset(
                    Assets.svg.heartMisBroke,
                    width: AppDimens.iconSizeLarge,
                    height: AppDimens.iconSizeLarge,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 30,
              left: 80,
              child: Opacity(
                opacity: 0.2,
                child: Transform.rotate(
                  angle: -.4,
                  child: SvgPicture.asset(
                    Assets.svg.heartMisBroke,
                    width: AppDimens.iconSizeMedium,
                    height: AppDimens.iconSizeMedium,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 50,
              left: 20,
              child: Opacity(
                opacity: 0.6,
                child: Transform.rotate(
                  angle: .9,
                  child: SvgPicture.asset(
                    Assets.svg.heartMisBroke,
                    width: AppDimens.iconSizeSmall,
                    height: AppDimens.iconSizeSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}