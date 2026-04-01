import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAccountController extends GetxController {
  GlobalKey formKey = GlobalKey();
  var selectedValue = Rxn<String>();

  void updateSelection(String? value) {
    selectedValue.value = value;
  }
}
