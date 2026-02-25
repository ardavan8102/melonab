import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/audio_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/view/tabs/songs_tab.dart';
import 'package:melonab/presentation/widgets/app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class PageHandlerScreen extends StatefulWidget {
  const PageHandlerScreen({super.key});

  @override
  State<PageHandlerScreen> createState() => _PageHandlerScreenState();
}

class _PageHandlerScreenState extends State<PageHandlerScreen> {

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
      length: 5,
      child: Scaffold(
        appBar: CustomAppBar(
          leftIconPath: Assets.svg.menu,
          rightIconPath: Assets.svg.search,
          titleNormal: 'مِلــو',
          titleColorful: 'نــابــــ',
        ),
        body: Column(
          children: [
            
            AppDimens.marginSmall.height,

            TabBar(
              isScrollable: true,
              indicatorColor: AppSolidColors.primary,
              labelColor: AppSolidColors.primaryText,
              unselectedLabelColor: AppSolidColors.primaryText.withValues(alpha: .4),
              physics: BouncingScrollPhysics(),
              splashBorderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.smallRadius)),
              tabs: [
                Tab(
                  text: 'آهنگ ها',
                ),
              
                Tab(
                  text: 'آلبوم ها',
                ),
              
                Tab(
                  text: 'هنرمند ها',
                ),

                Tab(
                  text: 'پوشه ها',
                ),
              
                Tab(
                  text: 'سبک ها',
                ),
              ],
            ),
              
            Expanded(
              child: TabBarView(
                children: [
                  SongsTabView(),
              
                  Center(child: Text('Albums')),
              
                  Center(child: Text('Artists')),

                  Center(child: Text('Folders')),
              
                  Center(child: Text('Genres')),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

