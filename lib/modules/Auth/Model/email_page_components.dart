import 'package:flutter/material.dart';

class EmailPageComponents {
  static Widget TextWidget(
    String title,
    // String desciption,
    double fontsize,
    FontWeight fontweight,
  ) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Inter',
          fontSize: fontsize,
          height: 1.2,
          fontWeight: fontweight),
    );
  }
}
