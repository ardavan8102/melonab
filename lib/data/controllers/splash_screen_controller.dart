import 'package:get/get.dart';
import 'package:melonab/presentation/view/page_handler.dart';

class SplashScreenController extends GetxController {

  void loadHomeScreen() async {
    await Future.delayed(
      const Duration(seconds: 5)
    );

    Get.to(
      () => const PageHandlerScreen()
    );
  }

  RxDouble opacity = 0.0.obs;

  void animateOpacity() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        opacity.value = 1.0;
      }
    );
  }

}