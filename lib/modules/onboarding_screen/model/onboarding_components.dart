import 'package:flutter/material.dart';

class OnboardingComponents {
  static Widget textImageWidget(
    String imgPath,
    String title,
    String description,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imgPath,
          height: 300,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 32,
              height: 1.2,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 15),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff91919F),
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
