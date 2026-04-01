import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/bank_account_controller.dart';
import 'package:money_desk_app/modules/Setup%20Screen/model/bank_account_screen_components.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/add_new_account.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/setup_success_screen.dart';
import 'package:money_desk_app/my_app_button.dart';

class BankAccountScreen extends StatelessWidget {
  BankAccountController bankAccountController =
      Get.put(BankAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8C52FF),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 30,
          color: Color(0xffFFFFFF),
        ),
        backgroundColor: Color(0xFF8C52FF),
        title: Text(
          "Add new wallet",
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xffFFFFFF)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          BankAccountScreenComponents.TextWidget("Balance", 18),
          SizedBox(
            height: 17,
          ),
          BankAccountScreenComponents.TextWidget("\$00.0", 64),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            height: MediaQuery.of(context).size.height * .5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Chase",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xffF1F1FA))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Color(0xffF1F1FA)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() => DropdownMenu<String>(
                            width: MediaQuery.of(context).size.width - 32,
                            hintText: ' Bank',
                            initialSelection:
                                bankAccountController.selectedValue.value,
                            inputDecorationTheme: InputDecorationTheme(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Color(0xffF1F1FA))),
                            ),
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(
                                  value: 'Primary', label: 'Primary'),
                              DropdownMenuEntry(
                                  value: 'Secondary', label: 'Secondary'),
                            ],
                            onSelected: (value) {
                              bankAccountController.updateSelection(value);
                            },
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Bank",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Expanded(
                        child: BankAccountScreenComponents.ButtonWidget(
                            'assets/images/circle.png',
                            'assets/images/p.png',
                            'assets/images/citi.png',
                            'assets/images/symbol.png')),
                    Expanded(
                        child: BankAccountScreenComponents.ButtonWidget(
                            'assets/images/u.png',
                            'assets/images/mandiri.png',
                            'assets/images/bca.png',
                            '')),
                    SizedBox(
                      height: 10,
                    ),
                    MyButtons.primarybUtton(
                      context,
                      onTap: () {
                        Get.to(SetupSuccessScreen());
                      },
                      title: "Continue",
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
