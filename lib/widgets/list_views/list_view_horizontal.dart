import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/core/models/playlist_model.dart';
import 'package:melonab/gen/assets.gen.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key, required this.listItems});

  final RxList<PlaylistModel> listItems;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Get.height * .26,
      child: Obx(
        () => ListView.builder(
          itemCount: listItems.length,
          scrollDirection: .horizontal,
          itemBuilder: (context, index) {
            
            var item = listItems[index];
        
            return Padding(
              padding: index == listItems.length - 1
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(left: AppDimens.paddingLarge),
              child: GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: Get.width * .6,
                  height: 200,
                  child: Column(
                    children: [
                      // thumbnail
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(AppDimens.mediumRadius),
                        child: CachedNetworkImage(
                          imageUrl: item.thumbnail,
                          width: Get.width * .6,
                          alignment: Alignment.center,
                          height: 150,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: Get.width * .6,
                            height: 150,
                            color: AppSolidColors.primaryText.withValues(alpha: .1),
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppSolidColors.accent,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: Get.width * .6,
                            height: 150,
                            color: AppSolidColors.primaryText.withValues(alpha: .1),
                            child: const Icon(Icons.error, color: AppSolidColors.primaryText),
                          ),
                        ),
                      ),
                        
                      AppDimens.mediumSpacing.height,
                        
                      // title
                      Row(
                        children: [
                          // musics count
                          Row(
                            spacing: 4,
                            children: [
                              SvgPicture.asset(
                                Assets.svg.musicNote,
                                width: AppDimens.iconSizeSmall,
                                height: AppDimens.iconSizeSmall,
                              ),
                              
                              Text(
                                item.itemsCount.toString(),
                                style: textTheme.labelSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        
                          Expanded(
                            child: Text(
                              item.title,
                              style: textTheme.labelMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: .end,
                            ),
                          ),
                        ],
                      ),
                    
                      // caption
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.caption,
                          style: textTheme.labelSmall!.copyWith(
                            color: AppSolidColors.primaryText.withValues(alpha: .6),
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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