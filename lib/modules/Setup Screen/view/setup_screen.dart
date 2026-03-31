import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/setup_screen_controller.dart';
import 'package:money_desk_app/modules/Setup%20Screen/model/setup_screen_components.dart';

class SetupScreen extends StatefulWidget {
  SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreen();
}

class _SetupScreen extends State<SetupScreen> {
  SetupScreenController screenController = Get.put(SetupScreenController());
  void dispose() {
    screenController.controllerr
        .forEach((textcontroller) => textcontroller.dispose());
    screenController.nodefocus.forEach((node) => node.dispose());
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
                "Let's setup your PIN",
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(4, (index) {
                return SetupScreenComponents.OtpTextWidget(
                  index,
                  screenController,
                  context,
                );
              }),
            ),
            // SizedBox(
            //   height: 100,
            // ),
            Spacer(),
            SetupScreenComponents.Keypad("1", "2", "3", screenController),
            SetupScreenComponents.Keypad("4", "5", "6", screenController),

            SetupScreenComponents.Keypad("7", "8", "9", screenController),
            SetupScreenComponents.Keypad("", "0", "", screenController),
          ],
        ),
      ),
    );
  }
}
