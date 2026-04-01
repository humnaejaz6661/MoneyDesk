import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Setup%20Screen/controller/add_new_account_controller.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/add_new_account.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/bank_account_screen.dart';
import 'package:money_desk_app/my_app_button.dart';

class AddNewAccount extends StatelessWidget {
  AddNewAccountController addNewAccount = Get.put(AddNewAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          size: 30,
          color: Color(0xffFFFFFF),
        ),
        backgroundColor: Color(0xFF8C52FF),
        title: Text(
          "Add new account",
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
            height: MediaQuery.of(context).size.height * .3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Balance",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFCFCFC)),
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '\$00.0',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 64,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFCFCFC)),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            height: MediaQuery.of(context).size.height * .4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Name",
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
                      child: Obx(
                        () => DropdownMenu<String>(
                          width: MediaQuery.of(context).size.width - 32,
                          //32 pixel minus kr die total width ma sse
                          menuHeight: 120,
                          hintText: 'Select an option',
                          initialSelection: addNewAccount.selectedValue.value,
                          menuStyle: MenuStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          textStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          inputDecorationTheme: InputDecorationTheme(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: Color(0xffF1F1FA)),
                            ),
                          ),
                          dropdownMenuEntries: [
                            DropdownMenuEntry(
                                value: 'Primary', label: 'Primary'),
                            DropdownMenuEntry(
                                value: 'Secondary', label: 'Secondary'),
                          ],
                          onSelected: (value) {
                            addNewAccount.updateSelection(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    MyButtons.primarybUtton(
                      context,
                      onTap: () {
                        Get.to(BankAccountScreen());
                      },
                      title: "Continue",
                      backgroundColor: Color(0xff8C52FF),
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
