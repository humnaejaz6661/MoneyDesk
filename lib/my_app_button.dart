import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyButtons {
  static primarybUtton(BuildContext context,
      {GestureTapCallback? onTap,
      double? width,
      Color? color,
      Color? textColor,
      Color? backgroundColor,
      Color? foregroundColor,
      bool isDark = true,
      String title = "title",
      String? imagepath}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? MediaQuery.of(context).size.width, 60),
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //  padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        //  color ?? (isDark ? Color(0xFF8C52FF) : Color(0xffEEE5FF)),
        foregroundColor: foregroundColor,
        // color ?? (isDark ? Color(0xFF8C52FF) : Color(0xffEEE5FF)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagepath != null) SvgPicture.asset(imagepath, height: 20),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600
                //color:
                //  textColor ?? (isDark ? Colors.white : Color(0xFF8C52FF))
                ),
          )
        ],
      ),
    );
  }
}
