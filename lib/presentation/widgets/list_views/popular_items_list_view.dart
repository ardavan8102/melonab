import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/containers/dark_overlay.dart';
import 'package:melonab/presentation/widgets/containers/music_icon_stat.dart';

class PopularItemsListView extends StatelessWidget {
  const PopularItemsListView({
    super.key,
    required this.itemList,
  });

  final dynamic itemList;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Get.height * .25,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          final music = itemList[index];
          
          return Container(
            margin: index == 4
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: AppDimens.marginLarge),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  music.thumbnail,
                  maxHeight: (Get.height * .2).toInt(),
                  maxWidth: (Get.width * .5).toInt(),
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
            ),
            width: Get.width * .5,
            height: Get.height * .25,
            child: Stack(
              children: [
                DarkOverlayGradient(),
    
                // stats
                Positioned(
                  right: AppDimens.paddingSmall,
                  top: AppDimens.paddingSmall,
                  child: Container(
                    padding: EdgeInsets.all(AppDimens.paddingSmall),
                    decoration: BoxDecoration(
                      color: AppSolidColors.primary.withValues(alpha: .7),
                      borderRadius: BorderRadius.circular(AppDimens.smallRadius),
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: AppDimens.paddingMedium,
                      children: [
                        IconTextStatsForBigBanners(
                          iconPath: Assets.svg.musicNote,
                          label: music.itemsCount.toString(),
                        ),
                  
                        IconTextStatsForBigBanners(
                          iconPath: Assets.svg.heartMisBroke,
                          label: music.followers.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
    
                // title & description
                Positioned(
                  left: AppDimens.paddingSmall,
                  right: AppDimens.paddingSmall,
                  bottom: AppDimens.paddingSmall,
                  child: Column(
                    crossAxisAlignment: .end,
                    children: [
                      // song title
                      Text(
                        music.title,
                        style: textTheme.labelLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
    
                      Text(
                        music.caption,
                        style: textTheme.labelSmall!.copyWith(
                          color: AppSolidColors.primaryText.withValues(alpha: .6),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textDirection: .ltr,
                      ),
                    ],
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}