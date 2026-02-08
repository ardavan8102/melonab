import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/widgets/dividers/divider_custom.dart';
import 'package:melonab/widgets/drawer/header.dart';
import 'package:melonab/widgets/drawer/drawer_list_tile.dart';

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppSolidColors.drawerBackground,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // header
          DrawerMenuHeader(),

          AppDimens.mediumSpacing.height,

          SideDrawerListTile(
            label: 'صفحـه اصـلی',
            iconPath: Assets.icons.home.path,
          ),

          AppDimens.smallSpacing.height,
          CustomDivider(),

          SideDrawerListTile(
            label: 'ترانــه هــا',
            iconPath: Assets.icons.music.path,
          ),

          AppDimens.smallSpacing.height,
          CustomDivider(),

          SideDrawerListTile(
            label: 'پـلی لیـســت هـا',
            iconPath: Assets.icons.album.path,
          ),

          AppDimens.smallSpacing.height,
          CustomDivider(),

          SideDrawerListTile(
            label: 'پــادکســـت هـا',
            iconPath: Assets.icons.podcast.path,
          ),

          AppDimens.smallSpacing.height,
          CustomDivider(),

          SideDrawerListTile(
            label: 'تنظیـمـات',
            iconPath: Assets.icons.settings.path,
          ),
        ],
      ),
    );
  }
}