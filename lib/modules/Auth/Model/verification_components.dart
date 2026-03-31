import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationComponents {
  static Widget OtpTextWidget(
      int index, dynamic verificationPageController, BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: TextField(
        controller: verificationPageController.controllerr[index],
        focusNode: verificationPageController.nodefocus[index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context)
                .requestFocus(verificationPageController.nodefocus[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context)
                .requestFocus(verificationPageController.nodefocus[index - 1]);
          }
        },
        decoration: InputDecoration(
            counterText: '',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(40))),
        style: TextStyle(
            fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
