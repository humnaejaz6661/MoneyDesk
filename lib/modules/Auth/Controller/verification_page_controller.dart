import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPageController extends GetxController {
  List<TextEditingController> controllerr =
      List.generate(4, (_) => TextEditingController());
  List<FocusNode> nodefocus = List.generate(4, (_) => FocusNode());
}
