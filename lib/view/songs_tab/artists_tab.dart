import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';
import 'package:melonab/widgets/carousels/artists_banner_slider.dart';
import 'package:melonab/widgets/list_views/list_view_artists.dart';
import 'package:melonab/widgets/texts/section_title.dart';

class ArtistsTab extends StatelessWidget {
  ArtistsTab({super.key});

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    final artists = songListsViewModel.trendingArtists;
    
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppDimens.mediumSpacing.height,
        
            ArtistsBannerSlider(artists: artists),
            
            AppDimens.largeSpacing.height,
        
            // Title
            SectionTitle(
              title: 'خوش صـداهای ایـران',
              showAllButton: false,
            ),
        
            AppDimens.mediumSpacing.height,
        
            // List of hot recommended playlists
            ListViewArtists(listItems: artists),
        
            AppDimens.largeSpacing.height,
        
            // Title
            SectionTitle(
              title: 'ستـاره هـای خارجـی',
              showAllButton: false,
            ),
        
            AppDimens.mediumSpacing.height,
        
            // List of hot recommended playlists
            ListViewArtists(listItems: artists),
          ],
        ),
      ),
    );
  }
}