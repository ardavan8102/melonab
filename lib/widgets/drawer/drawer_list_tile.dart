import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/colors.dart';
import 'package:melonab/core/consts/dimens.dart';

class SideDrawerListTile extends StatelessWidget {
  const SideDrawerListTile({
    super.key,
    required this.label,
    required this.iconPath,
  });

  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: AppDimens.iconSizeMedium,
        height: AppDimens.iconSizeMedium,
        fit: BoxFit.contain,
        color: AppSolidColors.accent,
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: AppDimens.iconSizeSmall),
      title: Text(label),
      onTap: () {
        Get.back();
      },
    );
  }
}
