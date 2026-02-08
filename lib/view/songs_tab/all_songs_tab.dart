import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';
import 'package:melonab/widgets/list_views/popular_items_list_view.dart';
import 'package:melonab/widgets/list_views/top_songs_list_view.dart';
import 'package:melonab/widgets/texts/section_title.dart';

class AllSongsTab extends StatelessWidget {
  AllSongsTab({super.key});

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    final featuredMusicsList = songListsViewModel.featuredPlaylists;
    final newPlayLists = songListsViewModel.newPlaylists;

    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Column(
        children: [
          AppDimens.smallSpacing.height,
      
          SectionTitle(title: 'محبوب ترین ها'),

          AppDimens.mediumSpacing.height,

          PopularItemsListView(itemList: featuredMusicsList),

          AppDimens.largeSpacing.height,
      
          SectionTitle(title: 'برترین ترانـه هـا'),

          AppDimens.smallSpacing.height,

          Expanded(
            child: TopSongsListView(songsList: newPlayLists)
          ),
        ],
      ),
    );
  }
}