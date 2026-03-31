import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/setup_screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  bool isChecked = false;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.to(SetupScreen());
    }
  }
}
