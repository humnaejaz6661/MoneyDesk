import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/resetup_screen.dart';

class SetupScreenComponents {
  static Widget OtpTextWidget(
    int index,
    dynamic screenController,
    BuildContext context,
  ) {
    return Obx(() {
      screenController.refreshUI.value;
      bool isFilled = screenController.controllerr[index].text.isNotEmpty;

      return SizedBox(
        height: 30,
        width: 30,
        child: TextFormField(
          controller: screenController.controllerr[index],
          readOnly: true,
          showCursor: false,
          maxLength: 1,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: isFilled ? Colors.white : Colors.transparent,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFCFCFC), width: 1.5),
              borderRadius: BorderRadius.circular(40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFCFCFC), width: 1.5),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          style: TextStyle(color: Colors.transparent),
        ),
      );
    });
  }

  static Widget Keypad(
    String title1,
    String title2,
    String? title3,
    dynamic screenController,
  ) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (title1.isNotEmpty) screenController.updatePin(title1);
            },
            style: ElevatedButton.styleFrom(
                overlayColor: Colors.transparent,
                shadowColor: Colors.transparent,
                backgroundColor: Color(0xff8C52FF),
                foregroundColor: Color(0xffFCFCFC),
                elevation: 0),
            child: Text(title1, style: TextStyle(fontSize: 48)),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (title2.isNotEmpty) screenController.updatePin(title2);
            },
            style: ElevatedButton.styleFrom(
                overlayColor: Colors.transparent,
                shadowColor: Colors.transparent,
                backgroundColor: Color(0xff8C52FF),
                foregroundColor: Color(0xffFCFCFC),
                elevation: 0),
            child: Text(title2, style: TextStyle(fontSize: 48)),
          ),
        ),
        Expanded(
          child: title3 != null && title3.isNotEmpty
              ? ElevatedButton(
                  onPressed: () => screenController.updatePin(title3),
                  style: ElevatedButton.styleFrom(
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      backgroundColor: Color(0xff8C52FF),
                      foregroundColor: Color(0xffFCFCFC),
                      elevation: 0),
                  child: Text(title3, style: TextStyle(fontSize: 48)),
                )
              : IconButton(
                  onPressed: () => screenController.validateAndMove(),
                  icon: Icon(Icons.arrow_forward, color: Color(0xffFCFCFC)),
                  iconSize: 48,
                ),
        ),
      ],
    );
  }
}
