import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/View/login.dart';
import 'package:money_desk_app/my_app_button.dart';
import 'package:money_desk_app/modules/onboarding_screen/model/onboarding_components.dart';
import 'package:money_desk_app/modules/Auth/View/signup.dart';
import 'package:money_desk_app/modules/onboarding_screen/controller/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController onboardingController =
      Get.put(OnboardingController());
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: onboardingController.pageData.length,
                itemBuilder: (context, index) {
                  return OnboardingComponents.textImageWidget(
                    onboardingController.pageData[index]['image']!,
                    onboardingController.pageData[index]['title']!,
                    onboardingController.pageData[index]['description']!,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingController.pageData.length,
                (i) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: currentPage == i ? 16 : 12,
                  width: currentPage == i ? 16 : 12,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentPage == i
                        ? Color(0xFF7F3DFF)
                        : Color(0xFFEEE5FF),
                  ),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
            SizedBox(height: 40),
            MyButtons.primarybUtton(
              context,
              onTap: () {
                Get.to(Signup());
              },
              title: "Sign Up",
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 15),
            MyButtons.primarybUtton(
              context,
              isDark: false,
              foregroundColor: AppColors.primaryColor,
              backgroundColor: Color(0xffEEE5FF),
              onTap: () {
                Get.to(Login());
              },
              title: "Log In",
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
