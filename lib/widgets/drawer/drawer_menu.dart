import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/urls.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/core/helpers/open_comment_myket.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/widgets/dividers/divider_custom.dart';
import 'package:melonab/widgets/drawer/header.dart';
import 'package:melonab/widgets/drawer/drawer_list_tile.dart';
import 'package:share_plus/share_plus.dart';

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
            label: 'اشتـراک گذاری برنامه',
            iconPath: Assets.icons.share.path,
            onTap: () async {
              await SharePlus.instance.share(
                ShareParams(
                  title: 'اشتراک گذاری برنامه',
                  subject: 'اشتراک گذاری',
                  text: 'اپلیکیشن موزیک انلاین\n\nبی دغدغه و بدون دشواری به موسیقی های روز دنیا گوش فرا دهید و خوانندگان محبوب خود را دنبال کنید\nدانلود: ${CustomURLS.myKetAppPageUrl}'
                ),
              );
              Get.back();
            },
          ),

          AppDimens.smallSpacing.height,
          CustomDivider(),

          SideDrawerListTile(
            label: 'ثبت نظر و امتیاز',
            iconPath: Assets.icons.submitNazar.path,
            onTap: () async {
              await openMyketComment();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}