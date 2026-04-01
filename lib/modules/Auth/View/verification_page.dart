import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/Controller/verification_page_controller.dart';
import 'package:money_desk_app/modules/Auth/Model/verification_components.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/setup_screen.dart';
import 'package:money_desk_app/my_app_button.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPage();
}

class _VerificationPage extends State<VerificationPage> {
  VerificationPageController verificationPageController =
      Get.put(VerificationPageController());
  void dispose() {
    verificationPageController.controllerr
        .forEach((textcontroller) => textcontroller.dispose());
    verificationPageController.nodefocus.forEach((node) => node.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Verification",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //  Spacer(),
                Text(
                  "Enter your Verification Code",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return VerificationComponents.OtpTextWidget(
                        index, verificationPageController, context);
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 280,
                    child: RichText(
                      text: TextSpan(
                        text: "We send verification code to your email ",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: " brajaoma*****@gmail.com",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor),
                          ),
                          TextSpan(
                            text: " You can check your inbox.",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "I didn’t received the code? Send again",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: Color(0xFF8C52FF),
                            fontSize: 16,
                            // decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF8C52FF),
                            decorationThickness: 2.5,
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 280,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        color: Color(0xFF8C52FF),
                      )
                    ],
                  ),
                ),
                Spacer(),
                MyButtons.primarybUtton(context,
                    title: "Verify",
                    backgroundColor: Color(0xff8C52FF),
                    foregroundColor: Colors.white, onTap: () {
                  Get.to(SetupScreen());
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
