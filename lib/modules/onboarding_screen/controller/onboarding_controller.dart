import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final List<Map<String, String>> pageData = [
    {
      "image": "assets/images/handmoney.png",
      "title": "Gain total control\nof your money",
      "description": "Become your own money manager\nand make every cent count"
    },
    {
      "image": "assets/images/list.png",
      "title": "Know where your\nmoney goes",
      "description":
          "Track your transaction easily,\nwith categories and financial report"
    },
    {
      "image": "assets/images/plan.png",
      "title": "Planning ahead",
      "description": "Setup your budget for each category\nso you in control"
    },
  ];
  var currentPage = 0.obs;

  void updatePage(int index) {
    currentPage.value = index;
  }
}
