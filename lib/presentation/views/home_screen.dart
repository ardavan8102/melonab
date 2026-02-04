import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/presentation/views/home_tabs/general_tab.dart';
import 'package:melonab/presentation/widgets/main_widgets/app_bar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<String> get _tabs => [
    'همه',
    'تک آهنگ ها',
    'آلبوم ها',
    'هنرمندان',
  ];
  
  List<Widget> get _pages => [
    const HomeGeneralTab(),
    Text('تک آهنگ'),
    Text('آلبوم'),
    Text('هنرمندان'),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: AppDimens.paddingLarge),
        child: Column(
          children: [

            AppDimens.marginMedium.height,

            // tabs
            tabsListViewBuilder(),

            AppDimens.marginLarge.height,

            // tab contents
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox tabsListViewBuilder() {
    return SizedBox(
      width: double.infinity,
      height: AppDimens.paddingLarge * 2,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: _tabs.length,
        itemBuilder: (context, index) {

          final tabItem = _tabs[index];
          final isLastItem = index == _tabs.length - 1;
          final isItemSelected = index == _selectedIndex;

          return Padding(
            padding: isLastItem
              ? EdgeInsetsGeometry.zero
              : EdgeInsetsGeometry.only(left: AppDimens.paddingSmall),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppDimens.largeCircularRadius),
              splashColor: AppSolidColors.primary.withValues(alpha: .4),
              onTap: () {
                if (!isItemSelected) {
                  
                  setState(() {
                    _selectedIndex = index;
                  });

                }
              },
              child: Stack(
                children: [
                  // main box
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium, vertical: AppDimens.paddingSmall),
                    decoration: BoxDecoration(
                      gradient: isItemSelected ? LinearGradient(
                        colors: AppGradientColor.primaryFadeGradient,
                        begin: AlignmentGeometry.bottomCenter,
                        end: AlignmentGeometry.topCenter,
                      ) : null,
                      borderRadius: BorderRadius.circular(AppDimens.largeCircularRadius),
                    ),
                    child: Center(
                      child: Text(
                        tabItem
                      ),
                    ),
                  ),
            
                  // glow box
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}