import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/models/playlist_model.dart';

class TopSongsListView extends StatelessWidget {
  const TopSongsListView({
    super.key,
    required this.songsList,
  });

  final RxList<PlaylistModel> songsList;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: songsList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final playlist = songsList[index];
    
        return Padding(
          padding: index == songsList.length - 1
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: AppDimens.paddingMedium),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            // image
            trailing: Container(
              height: AppDimens.thumbnailMedium,
              width: AppDimens.thumbnailMedium,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    playlist.thumbnail,
                    maxWidth: AppDimens.thumbnailMedium.toInt(),
                    maxHeight: AppDimens.thumbnailMedium.toInt(),
                  ),
                  fit: .cover,
                ),
                borderRadius: BorderRadius.circular(AppDimens.smallRadius),
              ),
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppGradientColor.darkOverlayGradient,
                  begin: .bottomCenter,
                  end: .topCenter,
                ),
                borderRadius: BorderRadius.circular(AppDimens.smallRadius),
              ),
              child: Center(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: AppDimens.iconSizeLarge,
                ),
              ),
            ),
            // name - caption
            title: Column(
              crossAxisAlignment: .end,
              mainAxisAlignment: .center,
              children: [
                Text(
                  playlist.title,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: textTheme.labelLarge!.copyWith(
                    fontSize: 15,
                  ),
                ),
                Text(
                  playlist.caption,
                  maxLines: 1,
                  overflow: .ellipsis,
                  textDirection: .ltr,
                  style: textTheme.labelLarge!.copyWith(
                    fontSize: 12,
                    color: AppSolidColors.primaryText.withValues(alpha: .5)
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}