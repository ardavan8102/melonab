import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/strings.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/widgets/drawer/brand_stats.dart';

class DrawerMenuHeader extends StatelessWidget {
  const DrawerMenuHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Get.height * .32,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: AppSolidColors.drawerHeaderBackground
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            // logo
            Image.asset(
              Assets.img.transparentLogo.path,
              width: 100,
              height: 100,
            ),
            Text(
              AppStrings.brandNameFa,
              style: textTheme.titleLarge,
            ),
    
            AppDimens.mediumSpacing.height,
      
            // stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BrandStatsColumn(number: 100, label: 'خواننده'),
                BrandStatsColumn(number: 5000, label: 'ترانـه'),
                BrandStatsColumn(number: 300, label: 'پلی لیست'),
              ],
            ),
          ],
        )
      ),
    );
  }
}