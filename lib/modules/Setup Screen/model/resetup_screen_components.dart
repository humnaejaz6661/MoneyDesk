import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/resetup_screen.dart';

class ResetupScreenComponents {
  static Widget OtpTextWidget(
      int index, dynamic controller, BuildContext context) {
    return Obx(() {
      bool isFilled = controller.controllerr[index].text.isNotEmpty;

      controller.refreshUI.value;

      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isFilled ? Colors.white : Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
      );
    });
  }
  // static Widget Keypad(
  //   String title1,
  //   String title2,
  //   String? title3,
  //   dynamic resetscreenController,
  // ) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: ElevatedButton(
  //           onPressed: () {
  //             if (title1.isNotEmpty) resetscreenController.updatePin(title1);
  //           },
  //           style: ElevatedButton.styleFrom(
  //               overlayColor: Colors.transparent,
  //               shadowColor: Colors.transparent,
  //               backgroundColor: Color(0xff8C52FF),
  //               foregroundColor: Color(0xffFCFCFC),
  //               elevation: 0),
  //           child: Text(title1, style: TextStyle(fontSize: 48)),
  //         ),
  //       ),
  //       Expanded(
  //         child: ElevatedButton(
  //           onPressed: () {
  //             if (title2.isNotEmpty) resetscreenController.updatePin(title2);
  //           },
  //           style: ElevatedButton.styleFrom(
  //               overlayColor: Colors.transparent,
  //               shadowColor: Colors.transparent,
  //               backgroundColor: Color(0xff8C52FF),
  //               foregroundColor: Color(0xffFCFCFC),
  //               elevation: 0),
  //           child: Text(title2, style: TextStyle(fontSize: 48)),
  //         ),
  //       ),
  //       Expanded(
  //         child: title3 != null && title3.isNotEmpty
  //             ? ElevatedButton(
  //                 onPressed: () => resetscreenController.updatePin(title3),
  //                 style: ElevatedButton.styleFrom(
  //                     overlayColor: Colors.transparent,
  //                     shadowColor: Colors.transparent,
  //                     backgroundColor: Color(0xff8C52FF),
  //                     foregroundColor: Color(0xffFCFCFC),
  //                     elevation: 0),
  //                 child: Text(title3, style: TextStyle(fontSize: 48)),
  //               )
  //             : IconButton(
  //                 onPressed: () => resetscreenController.validateAndMove(),
  //                 icon: Icon(Icons.arrow_forward, color: Color(0xffFCFCFC)),
  //                 iconSize: 48,
  //               ),
  //       ),
  //     ],
  //   );
  // }
}
