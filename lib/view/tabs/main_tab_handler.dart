import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melonab/view/tabs/home_view.dart';
import 'package:melonab/widgets/main_widgets/bottom_nav.dart';

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
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          // Home view
          HomeScreenView(),

          // songs view
          Center(
            child: Text(
              'Songs View',
              style: textTheme.headlineLarge,
            ),
          ),

          // settings view
          Center(
            child: Text(
              'Settings View',
              style: textTheme.headlineLarge,
            ),
          ),
        ]
      ),
      bottomNavigationBar: FloatingBottomNavigationBar(tabController: _tabController, selectedTabIndex: _selectedTabIndex),
    );
  }
}