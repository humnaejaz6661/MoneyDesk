import 'package:get/get.dart';

class BankAccountController extends GetxController {
  var selectedValue = Rxn<String>();

  void updateSelection(String? value) {
    selectedValue.value = value;
  }
}
