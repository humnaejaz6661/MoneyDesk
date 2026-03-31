import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/modules/Auth/View/email_page.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  void forgot() {
    if (formKey.currentState!.validate()) {
      Get.to(EmailPage());
    }
  }
}
