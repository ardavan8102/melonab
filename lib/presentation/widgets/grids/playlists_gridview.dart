import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/models/custom_playlist.dart';

class CustomPlaylistsGridView extends StatelessWidget {
  const CustomPlaylistsGridView({
    super.key,
    required this.playlists,
  });

  final RxList<CustomPlaylistModel> playlists;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppDimens.marginMedium,
        crossAxisSpacing: AppDimens.marginMedium,
        childAspectRatio: 1.1
      ),
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlistItem = playlists[index];
    
        return Container(
          padding: EdgeInsets.all(AppDimens.paddingMedium),
          decoration: BoxDecoration(
            color: playlistItem.playlistColor.withValues(alpha: .1),
            borderRadius: .circular(AppDimens.mediumRadius),
            border: Border.all(
              width: 1,
              color: playlistItem.playlistColor.withValues(alpha: .8)
            ),
            boxShadow: [
              BoxShadow(
                color: playlistItem.playlistColor.withValues(alpha: .4),
                blurRadius: 20,
                offset: Offset(0, 5)
              ),
            ],
          ),
          child: Column(
            spacing: AppDimens.marginSmall,
            crossAxisAlignment: .start,
            children: [
              Text(
                playlistItem.title,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(context).textTheme.labelLarge,
              ),
          
              Text(
                playlistItem.description,
                maxLines: 1,
                overflow: .ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),

              Divider(
                color: playlistItem.playlistColor,
              ),

              Expanded(
                child: Text(
                  'شامل ${playlistItem.songCount} آهنگ',
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 12
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}