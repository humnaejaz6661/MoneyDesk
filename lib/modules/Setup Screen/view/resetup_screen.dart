import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/resetup_screen_controller.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/setup_screen_controller.dart';
import 'package:money_desk_app/modules/Setup%20Screen/model/resetup_screen_components.dart';
import 'package:money_desk_app/modules/Setup%20Screen/model/setup_screen_components.dart';

class ResetupScreen extends StatefulWidget {
  ResetupScreen({super.key});

  @override
  State<ResetupScreen> createState() => _ResetupScreen();
}

class _ResetupScreen extends State<ResetupScreen> {
  ResetupScreenController resetscreenController =
      Get.put(ResetupScreenController());
  void dispose() {
    resetscreenController.controllerr
        .forEach((textcontroller) => textcontroller.dispose());
    resetscreenController.nodefocus.forEach((node) => node.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8C52FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Ok.Re-type setup your PIN",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFCFCFC)),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SetupScreenComponents.OtpTextWidget(
                  index,
                  resetscreenController,
                  context,
                );
              }),
            ),
            // SizedBox(
            //   height: 100,
            // ),
            Spacer(),
            ResetupScreenComponents.Keypad(
                "1", "2", "3", resetscreenController),
            ResetupScreenComponents.Keypad(
                "4", "5", "6", resetscreenController),
            ResetupScreenComponents.Keypad(
                "7", "8", "9", resetscreenController),
            ResetupScreenComponents.Keypad("", "0", "", resetscreenController),
          ],
        ),
      ),
    );
  }
}
