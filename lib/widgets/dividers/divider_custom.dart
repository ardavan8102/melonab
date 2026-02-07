import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppSolidColors.dividerColor.withValues(alpha: .15),
      indent: 20,
      endIndent: 20,
    );
  }
}