import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/view/songs_tab/all_songs_tab.dart';
import 'package:melonab/view_model/songs_tab_view_model.dart';
import 'package:melonab/widgets/main_widgets/app_bar.dart';

class SongsTabView extends StatefulWidget {
  const SongsTabView({super.key});

  @override
  State<SongsTabView> createState() => _SongsTabViewState();
}

class _SongsTabViewState extends State<SongsTabView> with SingleTickerProviderStateMixin {

  final SongsTabViewModel viewModel = Get.put(SongsTabViewModel());

  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 5, vsync: this);
    tabController!.addListener(() {
      selectedIndex = tabController?.index ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        viewModel.searchTextFocusNode.value.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(viewModel: viewModel),
        body: Column(
          children: [
            AppDimens.mediumSpacing.height,

            TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: AppSolidColors.secondary,
              indicatorPadding: const EdgeInsetsGeometry.symmetric(horizontal: AppDimens.paddingMedium),
              labelStyle: textTheme.labelMedium!.copyWith(
                color: AppSolidColors.primaryText,
                fontSize: 14,
              ),
              unselectedLabelStyle: textTheme.labelSmall!.copyWith(
                color: AppSolidColors.primaryText.withValues(alpha: .5),
              ),
              tabs: const [
                Tab(height: AppDimens.marginLarge * 2, child: Text('تـرانـه هـا')),
                Tab(height: AppDimens.marginLarge * 2, child: Text('آلبــوم هـا')),
                Tab(height: AppDimens.marginLarge * 2, child: Text('هنرمنـدان')),
                Tab(height: AppDimens.marginLarge * 2, child: Text('پـلی لیســت هـا')),
                Tab(height: AppDimens.marginLarge * 2, child: Text('سبـکـ هـا')),
              ],
            ),

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  AllSongsTab(),
                  const Center(child: Text('Albums')),
                  const Center(child: Text('Artists')),
                  const Center(child: Text('Playlists')),
                  const Center(child: Text('Genres')),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}