import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:melonab/core/models/models.dart';

class HomeViewModel extends GetxController {
  final searchTextContoller = TextEditingController().obs;
  final searchTextFocusNode = FocusNode().obs;

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

  @override
  void onClose() {
    searchTextContoller.value.dispose();
    super.onClose();
  }
}