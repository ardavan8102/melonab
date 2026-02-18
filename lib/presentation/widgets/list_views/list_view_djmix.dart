import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/extensions/sized_box.dart';
import 'package:melonab/data/models/dj_mix_model.dart';
import 'package:melonab/presentation/view/player/audio_player.dart';

class ListViewDjmix extends StatelessWidget {
  const ListViewDjmix({super.key, required this.listItems});

  final RxList<DJMixModel> listItems;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Get.height * .3,
      child: Obx(
        () => ListView.builder(
          itemCount: listItems.length,
          scrollDirection: .vertical,
          itemBuilder: (context, index) {
            
            var item = listItems[index];
        
            return Padding(
              padding: index == listItems.length - 1
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: AppDimens.paddingLarge),
              child: GestureDetector(
                onTap: () => Get.to(
                  AudioPlayerScreen(
                    artistName: item.podcastArtist,
                    audioUrl: item.link,
                    photoUrl: item.photo,
                    songName: item.title,
                  )
                ),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * .1,
                  child: Row(
                    spacing: AppDimens.smallSpacing / 1.6,
                    children: [
                      // title
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .end,
                          children: [
                            // mix title
                            Text(
                              item.title,
                              style: textTheme.labelMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: .start,
                              textDirection: .ltr,
                            ),
                        
                            // artist name
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                item.podcastArtist,
                                style: textTheme.labelSmall!.copyWith(
                                  color: AppSolidColors.primaryText.withValues(alpha: .6),
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                
                            Row(
                              mainAxisAlignment: .end,
                              children: [
                                // likes
                                Text(
                                  '${item.likes} Likes',
                                  textDirection: .ltr,
                                  style: textTheme.labelSmall!.copyWith(
                                    color: AppSolidColors.primaryText.withValues(alpha: .6),
                                    fontSize: 12,
                                  ),
                                ),
                
                                // plays
                                Text(
                                  '${item.plays} Views  |  ',
                                  textDirection: .ltr,
                                  style: textTheme.labelSmall!.copyWith(
                                    color: AppSolidColors.primaryText.withValues(alpha: .6),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                
                      AppDimens.mediumSpacing.height,
                
                      // thumbnail
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(AppDimens.smallRadius),
                        child: CachedNetworkImage(
                          imageUrl: item.thumbnail,
                          alignment: Alignment.center,
                          width: Get.width * .2,
                          height: Get.width * .2,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: Get.width * .2,
                            height: Get.width * .2,
                            color: AppSolidColors.primaryText.withValues(alpha: .1),
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppSolidColors.accent,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: Get.width * .2,
                            height: Get.width * .2,
                            color: AppSolidColors.primaryText.withValues(alpha: .1),
                            child: const Icon(Icons.error, color: AppSolidColors.primaryText),
                          ),
                        ),
                      ),
                
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}