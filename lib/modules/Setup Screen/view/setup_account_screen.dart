import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Setup%20Screen/view/add_new_account.dart';
import 'package:money_desk_app/my_app_button.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
            Text(
              "Let’s setup your account!",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF212325)),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Account can be your bank, credit card or \nyour wallet ",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF292B2D)),
              ),
            ),
            Spacer(),
            MyButtons.primarybUtton(
              context,
              onTap: () {
                Get.to(AddNewAccount());
              },
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Color(0xffFCFCFC),
              title: "Let's go",
            )
          ],
        ),
      ),
    );
  }
}
