import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/Model/email_page_components.dart';
import 'package:money_desk_app/modules/Auth/View/reset_password_page.dart';
import 'package:money_desk_app/my_app_button.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/email_en.png",
              //   width: 300,
              height: 330,
              //fit: BoxFit.contain,
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  EmailPageComponents.TextWidget(
                      "Your email is on the way", 24, FontWeight.w600),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EmailPageComponents.TextWidget(
                        "Check your email test@test.com and follow the instructions to reset your password",
                        16,
                        FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 130,
            ),
            MyButtons.primarybUtton(
              context,
              onTap: () {
                Get.to(ResetPasswordPage());
              },
              title: "Continue",
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
