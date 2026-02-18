import 'dart:developer';

import 'package:get/get.dart';
import 'package:melonab/core/consts/urls.dart';
import 'package:melonab/data/models/playlist_model.dart';
import 'package:melonab/data/models/sections/home_section_model.dart';
import 'package:melonab/data/models/sections/section_type.dart';
import 'package:melonab/data/services/dio_service.dart';

class HomeSectionsViewModel extends GetxController {
  final DioService dioService = DioService();

  /// Sections
  final RxList<HomeSectionModel> sections = <HomeSectionModel>[].obs;

  // section contains
  final RxList<HomeSectionModel> headers = <HomeSectionModel>[].obs;
  final RxMap<String, List<dynamic>> sectionItems = <String, List<dynamic>>{}.obs;

  final Set<String> hiddenSectionTypes = {
    'recently_played',
  };


  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    try {
      final response = await dioService.getMethod(ApiUrls.homeItemsUrl);

      if (response?.statusCode == 200) {
        final data = response.data;

        /// hide these:
        const Set<String> hiddenSectionIds = {
          'recently_played',
          'recently_played_header',
        };

        /// parse + filter
        final List<HomeSectionModel> parsedSections =
            (data['sections'] as List)
                .map((e) => HomeSectionModel.fromJson(e))
                .where((section) => !hiddenSectionIds.contains(section.id))
                .toList();

        sections.value = parsedSections;

        headers.value = parsedSections
            .where((s) => s.type == SectionType.header)
            .toList();

        sectionItems.clear();
        for (final section in parsedSections) {
          if (section.items.isNotEmpty) {
            sectionItems[section.id] = section.items;
          }
        }
      }
    } catch (e) {
      log('❌ fetchHomeData error: $e');
    }
  }


  List<PlaylistModel> getPlaylistsBySectionId(String sectionId) {
    final section = sections.firstWhereOrNull(
      (s) => s.id == sectionId && s.items.isNotEmpty,
    );

    if (section == null) return [];

    return section.items
        .where((e) => e['type'] == 'playlist')
        .map((e) => PlaylistModel.fromJson(e))
        .toList();
  }
}