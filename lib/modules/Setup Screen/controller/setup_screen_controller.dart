import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/resetup_screen.dart';

class SetupScreenController extends GetxController {
  List<TextEditingController> controllerr =
      List.generate(4, (_) => TextEditingController());

  List<FocusNode> nodefocus = List.generate(4, (_) => FocusNode());

  RxInt refreshUI = 0.obs;

  void updatePin(String value) {
    for (var i = 0; i < controllerr.length; i++) {
      if (controllerr[i].text.isEmpty) {
        controllerr[i].text = value;
        refreshUI.value++;
        break;
      }
    }
  }

  void deletePin() {
    for (var i = controllerr.length - 1; i >= 0; i--) {
      if (controllerr[i].text.isNotEmpty) {
        controllerr[i].clear();
        refreshUI.value++;
        break;
      }
    }
  }

  bool isPinComplete() {
    return controllerr.every((element) => element.text.isNotEmpty);
  }

  void validateAndMove() {
    if (isPinComplete()) {
      Get.to(() => ResetupScreen());
    } else {
      Get.snackbar(
        "Error",
        "Please enter a 4-digit PIN",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
