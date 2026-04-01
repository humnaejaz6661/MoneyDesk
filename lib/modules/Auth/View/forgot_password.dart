import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/Controller/forgot_password_controller.dart';
import 'package:money_desk_app/modules/Auth/Controller/signup_controller.dart';
import 'package:money_desk_app/modules/Auth/Model/signup_components.dart';
import 'package:money_desk_app/modules/Auth/View/email_page.dart';
import 'package:money_desk_app/my_app_button.dart';

class forgotpage extends StatelessWidget {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
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
              key: forgotPasswordController.formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      "Don't worry.\nEnter your email and we'll send you a link to reset your password.",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SignupComponents.customtextField(
                      hinttext: "Email",
                      controller: forgotPasswordController.emailcontroller,
                      keyboardtype: TextInputType.emailAddress,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return "Enter Valid Email";
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
                  forgotPasswordController.forgot();
                },
                title: "Continue",
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
