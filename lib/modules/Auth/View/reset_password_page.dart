import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/Controller/reset_password_controller.dart';
import 'package:money_desk_app/modules/Auth/Model/reset_password_components.dart';

import 'package:money_desk_app/modules/Auth/View/login.dart';
import 'package:money_desk_app/my_app_button.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  ResetPasswordController resetPasswordController = ResetPasswordController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Form(
              key: resetPasswordController.formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    ResetPasswordComponents.customtextField(
                      hinttext: "Password",
                      controller: resetPasswordController.emailcontroller,
                      // keyboardtype: TextInputType.emailAddress,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Password";
                        } else if (value.length < 6) {
                          return "Enter Password with at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ResetPasswordComponents.customtextField(
                      hinttext: " Retype new password",
                      controller: resetPasswordController.emaillcontroller,
                      keyboardtype: TextInputType.emailAddress,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        } else if (value.length < 6) {
                          return "Enter Password with at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(children: [
              MyButtons.primarybUtton(
                context,
                onTap: () {
                  resetPasswordController.reset();
                },
                title: "Save",
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
