import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:melonab/core/consts/dimens.dart';
import 'package:melonab/core/consts/strings.dart';
import 'package:melonab/data/extensions/sized_box.dart';
import 'package:melonab/gen/assets.gen.dart';
import 'package:melonab/presentation/view_model/drawer_menu_view_model.dart';
import 'package:melonab/presentation/view_model/home/home_view_model.dart';
import 'package:melonab/presentation/view_model/home/home_items.dart';
import 'package:melonab/presentation/view_model/splash_view_model.dart';
import 'package:melonab/presentation/widgets/loaders/circle_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashViewModel = Get.put(SplashViewModel());

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    splashViewModel.animateOpacity();
    splashViewModel.loadView();
    Get.put(DrawerMenuViewModel());
    Get.put(HomeViewModel());
    Get.put(HomeSectionsViewModel());
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            opacity: splashViewModel.opacity.value,
            duration: const Duration(seconds: 3),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Spacer(),
            
                // Logo
                Image.asset(
                  Assets.img.transparentLogo.path,
                  width: Get.width * .5,
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
                LoadingCircles(),
            
                AppDimens.largeSpacing.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}