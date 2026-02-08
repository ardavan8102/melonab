import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:melonab/view/home/home_view.dart';
import 'package:melonab/view/settings/settings_tab.dart';
import 'package:melonab/view/songs_tab/songs_tab.dart';
import 'package:melonab/view_model/drawer_menu_view_model.dart';
import 'package:melonab/widgets/main_widgets/bottom_nav.dart';
import 'package:melonab/widgets/drawer/drawer_menu.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with SingleTickerProviderStateMixin {

  TabController? _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _tabController = TabController(length: 3, vsync: this);

    _tabController?.addListener(
      () {
        _selectedTabIndex = _tabController?.index ?? 0;
        setState(() {
          
        });
      }
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final drawer = Get.find<DrawerMenuViewModel>();

    return Scaffold(
      key: drawer.scaffoldKey,
      drawer: CustomDrawerMenu(),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Home view
          HomeScreenView(),

          // songs view
          SongsTabView(),

          // settings view
          SettingsTabView(),
        ]
      ),
      bottomNavigationBar: FloatingBottomNavigationBar(tabController: _tabController, selectedTabIndex: _selectedTabIndex),
    );
  }
}