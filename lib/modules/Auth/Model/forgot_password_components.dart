import 'package:flutter/material.dart';

class ForgotPasswordComponents {
  static Widget customtextField({
    required String hinttext,
    TextInputType? keyboardtype,
    required TextEditingController controller,
    String? Function(String?)? validation,
    Widget? suffixicon,
    bool obscuretext = false,
  }) {
    return TextFormField(
      keyboardType: keyboardtype,
      controller: controller,
      validator: validation,
      obscureText: obscuretext,
      decoration: InputDecoration(
        suffixIcon: suffixicon,
        hintText: hinttext,
        hintStyle: TextStyle(
            color: Color(0xff91919F),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 1, color: Color(0xffF1F1FA))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 1, color: Colors.blue)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 1, color: Colors.red),
        ),
      ),
    );
  }
}
