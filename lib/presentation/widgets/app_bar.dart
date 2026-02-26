import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.titleNormal,
    required this.titleColorful,
    this.backgroundColor,
    required this.rightIconPath,
    required this.leftIconPath,
  });

  final String titleNormal;
  final String titleColorful;
  final Color? backgroundColor;
  final String rightIconPath;
  final String leftIconPath;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Text(
                titleColorful,
                style: textTheme.titleSmall!.copyWith(
                  color: AppSolidColors.secondary,
                ),
              )
            ),

            WidgetSpan(
              child: SizedBox(width: 4)
            ),

            WidgetSpan(
              child: Text(
                titleNormal,
                style: textTheme.titleSmall,
              )
            ),
          ]
        )
      ),
      actions: [
        GestureDetector(
          onTap: () {
            
          },
          child: SvgPicture.asset(
            rightIconPath,
            width: AppDimens.iconSizeLarge,
          ),
        ),

        AppDimens.marginMedium.width,

        GestureDetector(
          onTap: () {
            
          },
          child: SvgPicture.asset(
            leftIconPath,
            width: AppDimens.iconSizeLarge,
          ),
        ),
      ],
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.only(left: AppDimens.paddingMedium),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
