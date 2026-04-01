import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/setup_screen_controller.dart';
import 'package:money_desk_app/modules/Setup%20Screen/model/setup_screen_components.dart';

class SetupScreen extends StatelessWidget {
  SetupScreenController screenController = Get.put(SetupScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8C52FF),
      body: Column(
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
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SetupScreenComponents.OtpTextWidget(
                  index,
                  screenController,
                  context,
                ),
              );
            }),
          ),
          // SizedBox(
          //   height: 100,
          // ),
          Spacer(),
          // SetupScreenComponents.Keypad("1", "2", "3", screenController),
          // SetupScreenComponents.Keypad("4", "5", "6", screenController),

          // SetupScreenComponents.Keypad("7", "8", "9", screenController),
          // SetupScreenComponents.Keypad("", "0", "", screenController),
          //  height: MediaQuery.of(context).size.height * 0.45,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: GridView.builder(
              shrinkWrap:
                  true, //ye utni height leta ha jitni items ko require ho or agar is ko false krti ho to screen pr height jitni bhi hogi le le ga
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 15),
              itemCount: screenController.keypaditems.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      var clickedKey = screenController.keypaditems[index];

                      if (clickedKey is String) {
                        screenController.updatePin(clickedKey);
                      } else {
                        //agar icon click ho to back a jao
                        Icon icon = clickedKey as Icon;
                        if (icon.icon == Icons.arrow_back) {
                          Get.back();
                        } else if (icon.icon == Icons.arrow_forward) {
                          // agar forward click ho to move kr jay ga reset screen pr
                          screenController.validateAndMove();
                        }
                      }
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      alignment: Alignment.center,
                      child: screenController.keypaditems[index] is String
                          ? Text(
                              screenController.keypaditems[index],
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFCFCFC),
                                fontFamily: 'Inter',
                              ),
                            )
                          : IconTheme(
                              data: IconThemeData(
                                size: 45,
                                color: Color(0xffFCFCFC),
                              ),
                              child: screenController.keypaditems[index],
                            ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
