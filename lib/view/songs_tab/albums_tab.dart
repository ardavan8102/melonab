import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';

class SongAlbumsTab extends StatelessWidget {
  SongAlbumsTab({super.key});

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    final djmixAlbums = songListsViewModel.djMixes;

    return Column(
      children: [
        AppDimens.largeSpacing.height,

        Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: AppDimens.marginLarge,
              crossAxisSpacing: 0,
            ),
            itemCount: djmixAlbums.length,
            itemBuilder: (context, index) {
              final album = djmixAlbums[index];
                  
              return Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(AppDimens.mediumRadius),
                      child: CachedNetworkImage(
                        imageUrl: album.thumbnail,
                        fit: .cover,
                      ),
                    ),
                  ),

                  AppDimens.smallSpacing.height,

                  Text(album.title, maxLines: 1, overflow: .ellipsis)
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}