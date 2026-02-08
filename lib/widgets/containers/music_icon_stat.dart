import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melonab/core/consts/dimens.dart';

class IconTextStatsForBigBanners extends StatelessWidget {
  const IconTextStatsForBigBanners({
    super.key,
    required this.iconPath,
    required this.label,
  });

  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      spacing: AppDimens.paddingSmall,
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppDimens.iconSizeMedium,
          height: AppDimens.iconSizeMedium,
          colorFilter: ColorFilter.mode(Colors.white.withValues(alpha: .5), BlendMode.srcIn),
        ),
    
        Text(
          label,
          style: textTheme.labelMedium!.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}