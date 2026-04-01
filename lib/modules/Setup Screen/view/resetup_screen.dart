import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/resetup_screen_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8C52FF),
      body: Column(children: [
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
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SetupScreenComponents.OtpTextWidget(
                index,
                resetscreenController,
                context,
              ),
            );
          }),
        ),
        SizedBox(
          height: 100,
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: GridView.builder(
            shrinkWrap:
                true, // Ye zaroori hai taake Grid utni hi jagah le jitni buttons ko chahiye
            physics: const NeverScrollableScrollPhysics(), // Scroll band rahega
            padding: const EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.4, crossAxisSpacing: 15),
            itemCount: resetscreenController.keypaditems.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    var clickedKey = resetscreenController.keypaditems[index];

                    if (clickedKey is String) {
                      // Agar number click hua hai
                      resetscreenController.updatePin(clickedKey);
                    } else {
                      // Agar icon click hua hai
                      Icon icon = clickedKey as Icon;
                      if (icon.icon == Icons.arrow_back) {
                        Get.back();
                      } else if (icon.icon == Icons.arrow_forward) {
                        // Next screen logic
                        resetscreenController.validateAndMove();
                      }
                    }
                  },
                  // borderRadius: BorderRadius.circular(50),
                  child: Container(
                    alignment: Alignment.center,
                    child: resetscreenController.keypaditems[index] is String
                        ? Text(
                            resetscreenController.keypaditems[index],
                            style: TextStyle(
                              fontSize: 48,

                              fontWeight: FontWeight.w500,
                              color: Color(0xffFCFCFC),
                              fontFamily: 'Inter', // Agar Poppins available ha
                            ),
                          )
                        : IconTheme(
                            data: IconThemeData(
                              size: 45,
                              color: Color(0xffFCFCFC),
                            ), // Icons ka size yahan se control hoga
                            child: resetscreenController.keypaditems[index],
                          ),
                  ));
            },
          ),
        )
      ]),
    );
  }
}
