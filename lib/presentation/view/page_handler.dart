import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/view/tabs/playlists_tab.dart';
import 'package:melonab/presentation/view/tabs/songs_tab.dart';
import 'package:melonab/presentation/widgets/app_bar.dart';
import 'package:melonab/presentation/widgets/containers/bottom_player.dart';
import 'package:permission_handler/permission_handler.dart';

class PageHandlerScreen extends StatefulWidget {
  const PageHandlerScreen({super.key});

  @override
  State<PageHandlerScreen> createState() => _PageHandlerScreenState();
}

class _PageHandlerScreenState extends State<PageHandlerScreen> {

  // ignore: unused_field
  bool _hasPermission = false;

  final audioController = AudioController();

  // Check device permission
  Future<void> _checkPermissionAndRequest() async {

    final permission = await Permission.audio.status;

    if ( permission.isGranted ) {

      setState(() {
        _hasPermission = true;
      });

      await audioController.loadSongs();

    } else {

      final result = await Permission.audio.request();
      setState(() {
        _hasPermission = true;
      });

      if ( result.isGranted ) {

        await audioController.loadSongs();


      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checkPermissionAndRequest();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leftIconPath: Assets.svg.menu,
          rightIconPath: Assets.svg.search,
          titleNormal: 'مِلــو',
          titleColorful: 'نــابــــ',
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              // Background Color
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppGradientColor.scaffoldBackgroundGradient,
                    begin: .bottomLeft,
                    end: .topRight,
                  ),
                ),
              ),


              // Blurred Overlay
              SizedBox(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 25,
                    sigmaY: 25,
                  ),
                )
              ),


              Positioned(
                top: Get.height * .1,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    
                    AppDimens.marginSmall.height,
                
                    TabBar(
                      tabAlignment: .fill,
                      isScrollable: false,
                      indicatorColor: AppSolidColors.primary,
                      labelColor: AppSolidColors.primaryText,
                      unselectedLabelColor: AppSolidColors.primaryText.withValues(alpha: .4),
                      splashBorderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.smallRadius)),
                      tabs: [
                        Tab(
                          text: 'همـه آهنگـ ها',
                        ),

                        Tab(
                          text: 'پلـی لیست ها',
                        ),
                      ],
                    ),
                      
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(), // Disable page swipe
                          children: [
                            SongsTabView(),
                        
                            CustomPlaylistsTabPage()
                          ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomPlayer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

