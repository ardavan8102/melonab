import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/core/models/artist_model.dart';

class ListViewArtists extends StatelessWidget {
  const ListViewArtists({super.key, required this.listItems});

  final RxList<ArtistModel> listItems;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: Get.height * .23,
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
              child: SizedBox(
                width: Get.width * .3,
                height: 200,
                child: Column(
                  children: [
                    // thumbnail
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(AppDimens.mediumRadius),
                      child: CachedNetworkImage(
                        imageUrl: item.photo,
                        width: Get.width * .3,
                        alignment: Alignment.center,
                        height: Get.width * .3,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: Get.width * .3,
                          height: Get.width * .3,
                          color: AppSolidColors.primaryText.withValues(alpha: .1),
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppSolidColors.accent,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: Get.width * .3,
                          height: Get.width * .3,
                          color: AppSolidColors.primaryText.withValues(alpha: .1),
                          child: const Icon(Icons.error, color: AppSolidColors.primaryText),
                        ),
                      ),
                    ),
        
                    AppDimens.mediumSpacing.height,
        
                    // title
                    Row(
                      children: [

                        Expanded(
                          child: Text(
                            item.name,
                            style: textTheme.labelMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: .start,
                            textDirection: .ltr,
                          ),
                        ),
                      ],
                    ),
                  
                    // caption
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.itemSubtitle,
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
            );
          },
        ),
      ),
    );
  }
}