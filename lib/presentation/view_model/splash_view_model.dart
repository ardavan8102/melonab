import 'package:get/get.dart';
import 'package:melonab/presentation/view/main_tab_handler.dart';

class SplashViewModel extends GetxController {

  void loadView() async {
    await Future.delayed(
      const Duration(seconds: 5)
    );

    Get.to(
      () => const MainTabView()
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