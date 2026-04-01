import 'dart:async';

import 'package:get/get.dart';
import 'package:money_desk_app/modules/onboarding_screen/view/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  void onInit() {
    super.onInit();

    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Get.off(() => OnboardingScreen());
    });
  }
}
