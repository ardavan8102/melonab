import 'package:flutter/material.dart';
import 'package:melonab/core/consts/dimens.dart';

class FilledCustomButton extends StatelessWidget {
  const FilledCustomButton({
    super.key,
    required this.onPress,
    required this.child,
    this.isPressed = false,
    this.backgroundColor = const Color(0xff8247ff),
    this.shadowColor,
    this.padding,
    this.radius,
  });

  final VoidCallback onPress;
  final Widget child;
  final bool isPressed;
  final Color backgroundColor;
  final Color? shadowColor;
  final EdgeInsets? padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: padding ?? const EdgeInsets.all(AppDimens.paddingMedium),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius ?? AppDimens.smallRadius),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 30,
              spreadRadius: 1,
              color: shadowColor ?? Colors.transparent,
            ),
          ],
        ),
        child: Center(child: child)
      ),
    );
  }
}
