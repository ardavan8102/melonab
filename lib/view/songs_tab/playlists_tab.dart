import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';
import 'package:melonab/widgets/list_views/top_songs_list_view.dart';

class PlaylistsTab extends StatelessWidget {
  PlaylistsTab({super.key});

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        children: [
          AppDimens.mediumSpacing.height,
      
          Expanded(
            child: TopSongsListView(songsList: songListsViewModel.newPlaylists)
          ),
        ],
      ),
    );
  }
}