import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/onboarding_screen/view/onboarding_screen.dart';
import 'package:money_desk_app/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child:
              //SvgPicture.asset('assets/images/MoneyDesk.svg'),
              Image.asset('assets/images/MoneyDesk.png')),
    );
  }
}
