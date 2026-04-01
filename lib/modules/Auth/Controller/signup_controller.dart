import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Auth/View/verification_page.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool isChecked = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  void signup() {
    if (formKey.currentState!.validate()) {
      Get.to(VerificationPage());
    }
  }
}
