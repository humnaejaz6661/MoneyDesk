import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_desk_app/core/theme/app_colors.dart';
import 'package:money_desk_app/modules/Auth/Controller/signup_controller.dart';
import 'package:money_desk_app/modules/Auth/Model/signup_components.dart';
import 'package:money_desk_app/modules/Auth/View/login.dart';
import 'package:money_desk_app/my_app_button.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> {
  final SignupController signupController = Get.put(SignupController());
  //Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
              fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: signupController.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    children: [
                      SignupComponents.customtextField(
                          hinttext: "Name",
                          controller: signupController.namecontroller,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Name";
                            } else if (value.length < 5) {
                              return "Name must be 5 characters";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 22,
                      ),
                      SignupComponents.customtextField(
                        hinttext: "Email",
                        controller: signupController.emailcontroller,
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
                            controller: signupController.passwordcontroller,
                            keyboardtype: TextInputType.emailAddress,
                            obscuretext:
                                !signupController.isPasswordVisible.value,
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
                                  signupController.togglePassword();
                                },
                                icon: Icon(
                                  signupController.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: signupController.isChecked,
                            activeColor: Color(0xff8C52FF),
                            onChanged: (bool? value) {
                              setState(() {
                                signupController.isChecked = value!;
                              });
                              side:
                              const BorderSide(
                                color: Color(0xff8C52FF),
                                width: 2.0,
                              );
                            },
                          ),
                          SizedBox(
                            width: 280,
                            child: RichText(
                              text: TextSpan(
                                text: "By siging up, you agree to the ",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service and Privacy Policy',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff8C52FF)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  MyButtons.primarybUtton(
                    context,
                    onTap: () {
                      signupController.signup();
                    },
                    title: "Sign Up",
                    backgroundColor: Color(0xff8C52FF),
                    foregroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Or with",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MyButtons.primarybUtton(context,
                      imagepath: "assets/images/Google.svg",
                      isDark: false,
                      backgroundColor: Color(0xffF1F1FA),
                      foregroundColor: Colors.black,
                      title: "Sign Up with Google", onTap: () {
                    Get.snackbar(
                      "Google",
                      "Continue with Google",
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: Color(0xFFACA9A9),
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(Login());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: Color(0xFF8C52FF),
                            fontSize: 16,
                            // decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF8C52FF),
                            decorationThickness: 2.5,
                          ),
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 40,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        color: AppColors.primaryColor,
                      )
                    ],
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
