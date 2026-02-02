import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/containers/home_big_banner.dart';
import 'package:melonab/presentation/widgets/containers/home_card_small.dart';

class HomeGeneralTab extends StatelessWidget {
  const HomeGeneralTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: AppDimens.mediumRowHeight,
          child: Row(
            spacing: AppDimens.marginLarge,
            children: [
              Expanded(
                child: HomeCardSmall(
                  bgColorList: AppGradientColor.homeScreenCardSmall1,
                  iconBottomRight: Assets.svg.dualMusicNote,
                  iconTopLeft: Assets.svg.musicNote,
                  label: 'جدیدترین',
                )
              ),

              Expanded(
                child: HomeCardSmall(
                  bgColorList: AppGradientColor.homeScreenCardSmall2,
                  iconBottomRight: Assets.svg.heartMisBroke,
                  iconTopLeft: Assets.svg.dualMusicNote,
                  label: 'محبوب ترین',
                )
              ),
            ],
          ),
        ),

        AppDimens.marginLarge.height,

        // big banner
        HomeBigBanner(),
      ],
    );
  }
}