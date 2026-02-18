import 'package:flutter/material.dart';
import 'package:melonab/core/consts/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.onTap,
    this.showAllButton = false,
  });

  final String title;
  final bool showAllButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.labelLarge,
        ),

        showAllButton ? GestureDetector(
          onTap: onTap,
          child: Row(
            spacing: 4,
            children: [
              Text(
                'همه',
                style: textTheme.labelSmall?.copyWith(
                  color: AppSolidColors.secondary,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: AppSolidColors.primary),
            ],
          ),
        ) : SizedBox.shrink(),
      ],
    );
  }
}