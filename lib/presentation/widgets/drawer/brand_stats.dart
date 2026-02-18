import 'package:flutter/material.dart';

class BrandStatsColumn extends StatelessWidget {
  const BrandStatsColumn({
    super.key,
    required this.number,
    required this.label,
  });

  final int number;
  final String label;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text('$number+', style: textTheme.bodyLarge),
        Text(label, style: textTheme.bodySmall),
      ],
    );
  }
}
