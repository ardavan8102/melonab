import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view_model/home_view_model.dart';
import 'package:melonab/view_model/song_lists_view_model.dart';
import 'package:melonab/widgets/dividers/divider_custom.dart';
import 'package:melonab/widgets/list_views/list_view_artists.dart';
import 'package:melonab/widgets/list_views/list_view_djmix.dart';
import 'package:melonab/widgets/list_views/list_view_horizontal.dart';
import 'package:melonab/widgets/main_widgets/app_bar.dart';
import 'package:melonab/widgets/texts/section_title.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  final HomeViewModel homeViewModel = Get.find<HomeViewModel>();
  final SongListsViewModel songListsViewModel = Get.find<SongListsViewModel>();

  @override
  Widget build(BuildContext context) {
    //TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        homeViewModel.searchTextFocusNode.value.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(viewModel: homeViewModel),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingMedium),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  AppDimens.smallSpacing.height,

                  // Title
                  SectionTitle(title: 'محبوب ترین پلی لیست ها'),

                  AppDimens.mediumSpacing.height,

                  // List of hot recommended playlists
                  ListViewHorizontal(listItems: songListsViewModel.featuredPlaylists),

                  // Divider
                  CustomDivider(),

                  AppDimens.smallSpacing.height,

                  // Title
                  SectionTitle(
                    title: 'خواننده های محبوب',
                    showAllButton: true
                  ),

                  AppDimens.mediumSpacing.height,

                  // List of hot recommended playlists
                  ListViewArtists(listItems: songListsViewModel.trendingArtists),

                  // Divider
                  CustomDivider(),


                  AppDimens.smallSpacing.height,

                  // Title
                  SectionTitle(
                    title: 'ریمیکس های جدید',
                    showAllButton: true,
                  ),

                  AppDimens.mediumSpacing.height,

                  // List of hot recommended playlists
                  ListViewDjmix(listItems: songListsViewModel.djMixes),

                  // Divider
                  CustomDivider(),


                  AppDimens.smallSpacing.height,

                  // Title
                  SectionTitle(title: 'جدیدترین پلی لیست ها'),

                  AppDimens.mediumSpacing.height,

                  // List of hot recommended playlists
                  ListViewHorizontal(listItems: songListsViewModel.newPlaylists),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}