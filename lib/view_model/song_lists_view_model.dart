import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:melonab/core/models/artist_model.dart';
import 'package:melonab/core/models/dj_mix_model.dart';
import 'package:melonab/core/models/playlist_model.dart';

class SongListsViewModel extends GetxController {

  // Rx Lists for different data types
  final RxList<PlaylistModel> featuredPlaylists = RxList<PlaylistModel>();
  final RxList<PlaylistModel> newPlaylists = RxList<PlaylistModel>();
  final RxList<ArtistModel> trendingArtists = RxList<ArtistModel>();
  final RxList<DJMixModel> djMixes = RxList<DJMixModel>();

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  /// Load home data from JSON file
  Future<void> loadHomeData() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/home_items.json');
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      if (jsonData.containsKey('sections')) {
        final List<dynamic> sections = jsonData['sections'] as List<dynamic>;

        for (var section in sections) {
          final String sectionId = section['id'] as String? ?? '';
          final String sectionType = section['type'] as String? ?? '';

          if (sectionType == 'slider_square') {
            final List<dynamic> items = section['items'] as List<dynamic>? ?? [];

            switch (sectionId) {
              case 'playlists':
                featuredPlaylists.value = items
                    .map((item) => PlaylistModel.fromJson(
                        item as Map<String, dynamic>))
                    .toList();
                break;
              case 'top_artists_header':
                trendingArtists.value = items
                    .map((item) => ArtistModel.fromJson(
                        item as Map<String, dynamic>))
                    .toList();
                break;
              case 'home_djmixes':
                djMixes.value = items
                    .map((item) =>
                        DJMixModel.fromJson(item as Map<String, dynamic>))
                    .toList();
                break;
              case 'new_playlists':
                newPlaylists.value = items
                    .map((item) => PlaylistModel.fromJson(
                        item as Map<String, dynamic>))
                    .toList();
                break;
            }
          }
        }
      }
    } catch (e) {
      log('Error loading home data: $e');
    }
  }

}