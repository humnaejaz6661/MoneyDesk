import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Auth/View/login.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController emaillcontroller = TextEditingController();

  void reset() {
    if (formKey.currentState!.validate()) {
      Get.offAll(Login());
    }
  }
}
