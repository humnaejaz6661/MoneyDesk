import 'package:flutter/material.dart';

class BankAccountScreenComponents {
  static Widget TextWidget(
    String title,
    double fontsize,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: fontsize,
              fontWeight: FontWeight.w600,
              color: Color(0xffFCFCFC)),
        ),
      ),
    );
  }

  static Widget ButtonWidget(
    String imagepath1,
    String imagepath2,
    String imagepath3,
    String? imagepath4,
  ) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                fixedSize: (Size(70, 30))),
            child: Image.asset(
              imagepath1,
              height: 40,
            )),
        SizedBox(
          width: 15,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.zero,
                fixedSize: (Size(70, 30))),
            child: Image.asset(imagepath2)),
        SizedBox(
          width: 15,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                fixedSize: (Size(70, 30))),
            child: Image.asset(imagepath3)),
        SizedBox(
          width: 15,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              padding: EdgeInsets.zero,
              fixedSize: (Size(70, 30))),
          child: imagepath4 != null && imagepath4.isNotEmpty
              ? Image.asset(imagepath4)
              : Text(
                  "See Other",
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff8C52FF),
                  ),
                ),
        ),
      ],
    );
  }
}
