import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/strings.dart';
import 'package:melonab/core/extensions/sized_box.dart';
import 'package:melonab/data/controllers/splash_screen_controller.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/widgets/loading_circle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final controller = Get.put(SplashScreenController());

  @override
  initState() {
    super.initState();
    controller.animateOpacity();
    controller.loadHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            opacity: controller.opacity.value,
            duration: const Duration(seconds: 3),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Spacer(),
            
                // Lottie animation
                Lottie.asset(
                  Assets.animations.musicSpaceman,
                ),
            
                // Brand Name
                Text(
                  AppStrings.brandNameFa,
                  style: textTheme.headlineLarge,
                ),
            
                Text(
                  AppStrings.brandSubText,
                  style: textTheme.labelMedium,
                ),
            
                Spacer(),
            
                // Loader
                LoadingCircle(),
            
                (AppDimens.marginLarge * 2).height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}