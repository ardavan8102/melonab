import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';

class HomeBigBanner extends StatelessWidget {
  const HomeBigBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: AppDimens.largeRowHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppGradientColor.homeScreenCardBig,
          begin: AlignmentGeometry.bottomLeft,
          end: AlignmentGeometry.topRight,
        ),
        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: AppDimens.marginSmall,
          children: [
            Text(
              'نظر شما برای ما مهمه',
              style: textTheme.labelMedium!.copyWith(
                color: AppSolidColors.darkPrimaryText.withValues(alpha: .8),
                fontSize: 14,
              ),
            ),
    
            Text(
              'بازخورد خود را برای ما ارسال کنید',
              style: textTheme.labelLarge!.copyWith(
                color: AppSolidColors.darkPrimaryText,
                fontSize: 18,
              )
            ),
          ],
        ),
      ),
    );
  }
}