import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/data/extensions/sized_box.dart';
import 'package:melonab/data/models/artist_model.dart';
import 'package:melonab/data/models/dj_mix_model.dart';
import 'package:melonab/data/models/playlist_model.dart';
import 'package:melonab/data/models/sections/home_section_model.dart';
import 'package:melonab/data/models/sections/section_type.dart';
import 'package:melonab/presentation/view_model/home/home_view_model.dart';
import 'package:melonab/presentation/view_model/home/home_items.dart';
import 'package:melonab/presentation/widgets/dividers/divider_custom.dart';
import 'package:melonab/presentation/widgets/list_views/list_view_artists.dart';
import 'package:melonab/presentation/widgets/list_views/list_view_djmix.dart';
import 'package:melonab/presentation/widgets/list_views/list_view_horizontal.dart';
import 'package:melonab/presentation/widgets/main_widgets/app_bar.dart';
import 'package:melonab/presentation/widgets/texts/section_title.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final HomeViewModel homeViewModel = Get.find<HomeViewModel>();
  final HomeSectionsViewModel songListsViewModel =
      Get.find<HomeSectionsViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeViewModel.searchTextFocusNode.value.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(viewModel: homeViewModel),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: songListsViewModel.sections
                    .map(_buildSection)
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(HomeSectionModel section) {
    switch (section.type) {
      case SectionType.header:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDimens.smallSpacing.height,
            SectionTitle(
              title: section.title ?? '',
              showAllButton: section.showLink ?? false,
            ),
            AppDimens.mediumSpacing.height,
          ],
        );

      case SectionType.sliderSquare:
        return _buildSliderSection(section);

      default:
        return const SizedBox.shrink();
    }
  }


  Widget _buildSliderSection(HomeSectionModel section) {
    if (section.items.isEmpty) {
      return const SizedBox.shrink();
    }

    final String itemType = section.items.first['type'];

    switch (itemType) {
      case 'playlist':
        return Column(
          children: [
            ListViewHorizontal(
              listItems: section.items
                  .map((e) => PlaylistModel.fromJson(e))
                  .toList()
                  .obs,
            ),
            const CustomDivider(),
          ],
        );

      case 'artist':
        return Column(
          children: [
            ListViewArtists(
              listItems: section.items
                  .map((e) => ArtistModel.fromJson(e))
                  .toList()
                  .obs,
            ),
            const CustomDivider(),
          ],
        );

      case 'dj_mix':
      case 'podcast':
        return Column(
          children: [
            ListViewDjmix(
              listItems: section.items
                  .map((e) => DJMixModel.fromJson(e))
                  .toList()
                  .obs,
            ),
            const CustomDivider(),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}