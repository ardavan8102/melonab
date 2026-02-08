import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/view_model/drawer_menu_view_model.dart';
import 'package:melonab/view_model/home_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppSolidColors.darkScaffoldBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () {
            final drawer = Get.find<DrawerMenuViewModel>();
            drawer.openDrawer();
          },
          child: SvgPicture.asset(
            Assets.svg.menu,
            width: AppDimens.iconSizeSmall,
            height: AppDimens.iconSizeSmall,
          )
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: Get.height * .06,
              decoration: BoxDecoration(
                color: AppSolidColors.lessDarkBackground,
                borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
              ),
              child: TextField(
                focusNode: homeViewModel.searchTextFocusNode.value,
                controller: homeViewModel.searchTextContoller.value,
                style: textTheme.labelSmall!.copyWith(
                  color: AppSolidColors.primaryText,
                  fontWeight: .w400
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  hint: Padding(
                    padding: const EdgeInsets.only(right: AppDimens.paddingMedium),
                    child: Text(
                      'جستجوی آهنگ...',
                      style: textTheme.labelSmall?.copyWith(
                        color: AppSolidColors.primaryText.withValues(alpha: .5),
                      ),
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                    borderSide: BorderSide(
                      color: AppSolidColors.primary,
                    )
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Assets.svg.search,
                      width: AppDimens.iconSizeSmall,
                      height: AppDimens.iconSizeSmall,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(AppDimens.appBarHeight);
}