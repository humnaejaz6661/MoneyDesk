import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/Controller/login_controller.dart';
import 'package:money_desk_app/modules/Auth/Model/signup_components.dart';
import 'package:money_desk_app/modules/Auth/View/forgot_password.dart';
import 'package:money_desk_app/modules/Auth/View/signup.dart';
import 'package:money_desk_app/my_app_button.dart';

class Login extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  //Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: loginController.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      SignupComponents.customtextField(
                        hinttext: "Email",
                        controller: loginController.emailcontroller,
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
                      SizedBox(
                        height: 22,
                      ),
                      Obx(
                        () => SignupComponents.customtextField(
                            hinttext: "Password",
                            controller: loginController.passwordcontroller,
                            obscuretext:
                                !loginController.isPasswordVisible.value,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter Password";
                              } else if (value.length < 6) {
                                return "Password character must be 6";
                              }
                              return null;
                            },
                            suffixicon: IconButton(
                                onPressed: () {
                                  loginController.togglePassword();
                                },
                                icon: Icon(
                                  loginController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  MyButtons.primarybUtton(
                    context,
                    onTap: () {
                      loginController.login();
                    },
                    title: "Login",
                    backgroundColor: Color(0xff8C52FF),
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(forgotpage());
                      },
                      child: Text("Forgot Password?",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xff91919F),
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Signup());
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: Color(0xFF8C52FF),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF8C52FF),
                        decorationThickness: 2.5,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
