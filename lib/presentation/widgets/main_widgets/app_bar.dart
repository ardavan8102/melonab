import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/strings.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/icon_buttons/svg_icon_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          AppDimens.paddingSmall.width, 

          Text(
            AppStrings.brandNameFa,
            style: textTheme.titleMedium,
          )
        ],
      ),
      actions: [
        IconSvgButton(
          splashColor: AppSolidColors.primary,
          iconPath: Assets.svg.search,
          function: () {},
          gradientColors: AppGradientColor.primaryFadeGradient,
        ),

        AppDimens.marginSmall.width,

        IconSvgButton(
          splashColor: AppSolidColors.secondary,
          iconPath: Assets.svg.heart,
          function: () {},
          gradientColors: AppGradientColor.secondaryFadeGradient,
        ),

        AppDimens.paddingLarge.width
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}