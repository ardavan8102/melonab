import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/gen/assets.gen.dart';

class FloatingBottomNavigationBar extends StatelessWidget {
  const FloatingBottomNavigationBar({
    super.key,
    required TabController? tabController,
    required int selectedTabIndex,
  }) : _tabController = tabController, _selectedTabIndex = selectedTabIndex;

  final TabController? _tabController;
  final int _selectedTabIndex;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(AppDimens.paddingLarge),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(AppDimens.mediumRadius),
        child: BottomAppBar(
          color: AppSolidColors.darkPrimaryBlue,
          elevation: 0,
          child: TabBar(
            controller: _tabController,
            indicatorColor: AppSolidColors.primary,
            indicatorWeight: 3,
            padding: EdgeInsets.fromLTRB(AppDimens.paddingSmall, AppDimens.paddingSmall, AppDimens.paddingSmall, 0),
            labelStyle: textTheme.labelSmall!.copyWith(
              fontSize: 14,
              fontWeight: .w400,
            ),
            unselectedLabelStyle: textTheme.labelSmall!.copyWith(
              fontSize: 14,
              fontWeight: .w300,
            ),
            unselectedLabelColor: AppSolidColors.primaryText.withValues(alpha: .5),
            tabs: [
              Tab(
                text: 'خانـه',
                icon: Opacity(
                  opacity: _selectedTabIndex == 0 ? 1.0 : .5,
                  child: Image.asset(
                    Assets.icons.home.path,
                    width: AppDimens.iconSizeMedium,
                    height: AppDimens.iconSizeMedium,
                  ),
                ),
              ),
              
              Tab(
                text: 'تـرانه هـا',
                icon: Opacity(
                  opacity: _selectedTabIndex == 1 ? 1.0 : .5,
                  child: Image.asset(
                    Assets.icons.music.path,
                    width: AppDimens.iconSizeMedium,
                    height: AppDimens.iconSizeMedium,
                  ),
                ),
              ),
        
              Tab(
                text: 'تنظیـمـات',
                icon: Opacity(
                  opacity: _selectedTabIndex == 2 ? 1.0 : .5,
                  child: Image.asset(
                    Assets.icons.settings.path,
                    width: AppDimens.iconSizeMedium,
                    height: AppDimens.iconSizeMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}