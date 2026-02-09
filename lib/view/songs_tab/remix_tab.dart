import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';

class RemixSongsTab extends StatelessWidget {
  RemixSongsTab({super.key});

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final djmixAlbums = songListsViewModel.djMixes;

    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        children: [
          AppDimens.largeSpacing.height,
      
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppDimens.marginLarge,
                crossAxisSpacing: AppDimens.marginLarge,
                childAspectRatio: .7,
              ),
              itemCount: djmixAlbums.length,
              itemBuilder: (context, index) {
                final album = djmixAlbums[index];
                    
                return Column(
                  crossAxisAlignment: .end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(AppDimens.mediumRadius),
                      child: CachedNetworkImage(
                        imageUrl: album.thumbnail,
                        fit: .cover,
                      ),
                    ),
      
                    AppDimens.smallSpacing.height,
      
                    Text(
                      album.title,
                      style: textTheme.labelLarge,
                      maxLines: 1, 
                      overflow: .ellipsis
                    ),
      
                    Text(
                      album.podcastArtist,
                      style: textTheme.labelSmall!.copyWith(
                        color: AppSolidColors.primaryText.withValues(alpha: .5),
                        fontSize: 12
                      ),
                      maxLines: 1, 
                      overflow: .ellipsis
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}