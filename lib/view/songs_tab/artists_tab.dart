import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';
import 'package:melonab/widgets/list_views/list_view_artists.dart';
import 'package:melonab/widgets/texts/section_title.dart';

class ArtistsTab extends StatelessWidget {
  ArtistsTab({super.key});

  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    final artists = songListsViewModel.trendingArtists;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppDimens.mediumSpacing.height,
        
            CarouselSlider(
              items: artists.map((artist) {
                return Container(
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        artist.photo,
                      ),
                      alignment: .topCenter,
                      fit: .cover
                    ),
                    borderRadius: BorderRadius.circular(AppDimens.mediumRadius)
                  ),
                  child: Stack(
                    children: [
                      // Overlay
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppGradientColor.darkOverlayGradient,
                            begin: .bottomCenter,
                            end: .topCenter,
                          ),
                          borderRadius: BorderRadius.circular(AppDimens.mediumRadius)
                        ),
                      ),
        
                      // name
                      Positioned(
                        left: AppDimens.paddingMedium,
                        right: AppDimens.paddingMedium,
                        bottom: AppDimens.paddingMedium,
                        child: Column(
                          children: [
                            Text(
                              artist.name,
                              style: textTheme.labelLarge,
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                        
                            Text(
                              artist.itemSubtitle,
                              style: textTheme.labelSmall!.copyWith(
                                color: AppSolidColors.primaryText.withValues(alpha: .5),
                              ),
                              maxLines: 1,
                              overflow: .ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
              ),
            ),
            
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